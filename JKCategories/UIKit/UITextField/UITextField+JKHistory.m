//
//  UITextField+History.m
//  Demo
//
//  Created by DamonDing on 15/5/26.
//  Copyright (c) 2015年 morenotepad. All rights reserved.
//

#import "UITextField+JKHistory.h"
#import <objc/runtime.h>

#define jk_history_X(view) (view.frame.origin.x)
#define jk_history_Y(view) (view.frame.origin.y)
#define jk_history_W(view) (view.frame.size.width)
#define jk_history_H(view) (view.frame.size.height)

static char kTextFieldIdentifyKey;
static char kTextFieldHistoryviewIdentifyKey;

#define jk_ANIMATION_DURATION 0.3f
#define jk_ITEM_HEIGHT 40
#define jk_CLEAR_BUTTON_HEIGHT 45
#define jk_MAX_HEIGHT 300


@interface UITextField ()<UITableViewDataSource,UITableViewDelegate>

@property (retain, nonatomic) UITableView *jk_historyTableView;

@end


@implementation UITextField (JKHistory)

- (NSString*)jk_identify {
    return objc_getAssociatedObject(self, &kTextFieldIdentifyKey);
}

- (void)setJk_identify:(NSString *)identify {
    objc_setAssociatedObject(self, &kTextFieldIdentifyKey, identify, OBJC_ASSOCIATION_RETAIN);
}

- (UITableView*)jk_historyTableView {
    UITableView* table = objc_getAssociatedObject(self, &kTextFieldHistoryviewIdentifyKey);
    
    if (table == nil) {
        table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITextFieldHistoryCell"];
        table.layer.borderColor = [UIColor grayColor].CGColor;
        table.layer.borderWidth = 1;
        table.delegate = self;
        table.dataSource = self;
        objc_setAssociatedObject(self, &kTextFieldHistoryviewIdentifyKey, table, OBJC_ASSOCIATION_RETAIN);
    }
    
    return table;
}

- (NSArray*)jk_loadHistroy {
    if (self.jk_identify == nil) {
        return nil;
    }

    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    NSDictionary* dic = [def objectForKey:@"UITextField+JKHistory"];
    
    if (dic != nil) {
        return [dic objectForKey:self.jk_identify];
    }

    return nil;
}

- (void)jk_synchronize {
    if (self.jk_identify == nil || [self.text length] == 0) {
        return;
    }
    
    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    NSDictionary* dic = [def objectForKey:@"UITextField+JKHistory"];
    NSArray* history = [dic objectForKey:self.jk_identify];
    
    NSMutableArray* newHistory = [NSMutableArray arrayWithArray:history];
    
    __block BOOL haveSameRecord = false;
    __weak typeof(self) weakSelf = self;
    
    [newHistory enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([(NSString*)obj isEqualToString:weakSelf.text]) {
            *stop = true;
            haveSameRecord = true;
        }
    }];
    
    if (haveSameRecord) {
        return;
    }
    
    [newHistory addObject:self.text];
    
    NSMutableDictionary* dic2 = [NSMutableDictionary dictionaryWithDictionary:dic];
    [dic2 setObject:newHistory forKey:self.jk_identify];
    
    [def setObject:dic2 forKey:@"UITextField+JKHistory"];
    
    [def synchronize];
}

- (void) jk_showHistory; {
    NSArray* history = [self jk_loadHistroy];
    
    if (self.jk_historyTableView.superview != nil || history == nil || history.count == 0) {
        return;
    }
    
    CGRect frame1 = CGRectMake(jk_history_X(self), jk_history_Y(self) + jk_history_H(self) + 1, jk_history_W(self), 1);
    CGRect frame2 = CGRectMake(jk_history_X(self), jk_history_Y(self) + jk_history_H(self) + 1, jk_history_W(self), MIN(jk_MAX_HEIGHT, jk_ITEM_HEIGHT * history.count + jk_CLEAR_BUTTON_HEIGHT));
    
    self.jk_historyTableView.frame = frame1;
    
    [self.superview addSubview:self.jk_historyTableView];
    
    [UIView animateWithDuration:jk_ANIMATION_DURATION animations:^{
        self.jk_historyTableView.frame = frame2;
    }];
}

- (void) jk_clearHistoryButtonClick:(UIButton*) button {
    [self jk_clearHistory];
    [self jk_hideHistroy];
}

- (void)jk_hideHistroy; {
    if (self.jk_historyTableView.superview == nil) {
        return;
    }

    CGRect frame1 = CGRectMake(jk_history_X(self), jk_history_Y(self) + jk_history_H(self) + 1, jk_history_W(self), 1);
    
    [UIView animateWithDuration:jk_ANIMATION_DURATION animations:^{
        self.jk_historyTableView.frame = frame1;
    } completion:^(BOOL finished) {
        [self.jk_historyTableView removeFromSuperview];
    }];
}

- (void) jk_clearHistory; {
    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    
    [def setObject:nil forKey:@"UITextField+JKHistory"];
    [def synchronize];
}


#pragma mark tableview datasource
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView; {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section; {
    return [self jk_loadHistroy].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath; {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITextFieldHistoryCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITextFieldHistoryCell"];
    }
    
    cell.textLabel.text = [self jk_loadHistroy][indexPath.row];
    
    return cell;
}
#pragma clang diagnostic pop

#pragma mark tableview delegate
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section; {
    UIButton* clearButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(jk_clearHistoryButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return clearButton;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath; {
    return jk_ITEM_HEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section; {
    return jk_CLEAR_BUTTON_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath; {
    self.text = [self jk_loadHistroy][indexPath.row];
    [self jk_hideHistroy];
}

@end
