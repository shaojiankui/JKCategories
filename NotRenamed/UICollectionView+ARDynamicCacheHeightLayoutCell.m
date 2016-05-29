// The MIT License (MIT)
//
// Copyright (c) 2015
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "UICollectionView+ARDynamicCacheHeightLayoutCell.h"
#import <objc/runtime.h>

typedef NS_ENUM(NSUInteger, ARDynamicSizeCaculateType) {
  ARDynamicSizeCaculateTypeSize = 0,
  ARDynamicSizeCaculateTypeHeight,
  ARDynamicSizeCaculateTypeWidth
};

#define ARLayoutCellInvalidateValue [NSValue valueWithCGSize:CGSizeZero]

@implementation UICollectionView (ARDynamicCacheHeightLayoutCell)

+ (void)load {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    [self swizzlingMethods];
  });
}

+ (void)swizzlingMethods {
  SEL selectors[] = {
    @selector(registerNib:forCellWithReuseIdentifier:),
    @selector(registerClass:forCellWithReuseIdentifier:),
    @selector(reloadData),
    @selector(reloadSections:),
    @selector(deleteSections:),
    @selector(moveSection:toSection:),
    @selector(reloadItemsAtIndexPaths:),
    @selector(deleteItemsAtIndexPaths:),
    @selector(moveItemAtIndexPath:toIndexPath:)
  };

  for (int i = 0; i < sizeof(selectors) / sizeof(SEL); i++) {
    SEL originalSelector = selectors[i];
    SEL swizzledSelector = NSSelectorFromString([@"ar_"
        stringByAppendingString:NSStringFromSelector(originalSelector)]);

    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);

    method_exchangeImplementations(originalMethod, swizzledMethod);
  }
}

- (CGSize)ar_sizeForCellWithIdentifier:(NSString *)identifier
                             indexPath:(NSIndexPath *)indexPath
                         configuration:
                             (void (^)(__kindof UICollectionViewCell *))
                                 configuration {
  return [self ar_sizeForCellWithIdentifier:identifier
                                  indexPath:indexPath
                                 fixedValue:0
                               caculateType:ARDynamicSizeCaculateTypeSize
                              configuration:configuration];
}

- (CGSize)ar_sizeForCellWithIdentifier:(NSString *)identifier
                             indexPath:(NSIndexPath *)indexPath
                            fixedWidth:(CGFloat)fixedWidth
                         configuration:
                             (void (^)(__kindof UICollectionViewCell *))
                                 configuration {
  return [self ar_sizeForCellWithIdentifier:identifier
                                  indexPath:indexPath
                                 fixedValue:fixedWidth
                               caculateType:ARDynamicSizeCaculateTypeWidth
                              configuration:configuration];
}

- (CGSize)ar_sizeForCellWithIdentifier:(NSString *)identifier
                             indexPath:(NSIndexPath *)indexPath
                           fixedHeight:(CGFloat)fixedHeight
                         configuration:
                             (void (^)(__kindof UICollectionViewCell *))
                                 configuration {
  return [self ar_sizeForCellWithIdentifier:identifier
                                  indexPath:indexPath
                                 fixedValue:fixedHeight
                               caculateType:ARDynamicSizeCaculateTypeHeight
                              configuration:configuration];
}

- (CGSize)ar_sizeForCellWithIdentifier:(NSString *)identifier
                             indexPath:(NSIndexPath *)indexPath
                            fixedValue:(CGFloat)fixedValue
                          caculateType:(ARDynamicSizeCaculateType)caculateType
                         configuration:
                             (void (^)(__kindof UICollectionViewCell *))
                                 configuration {
  BOOL hasCache = [self hasCacheAtIndexPath:indexPath];
  if (hasCache) {
    if (![[self sizeCacheAtIndexPath:indexPath]
            isEqualToValue:ARLayoutCellInvalidateValue]) {
      return [[self sizeCacheAtIndexPath:indexPath] CGSizeValue];
    }
  }

  // has no size chche
  UICollectionViewCell *cell =
      [self templeCaculateCellWithIdentifier:identifier];
  configuration(cell);
  CGSize size = CGSizeMake(fixedValue, fixedValue);
  if (caculateType != ARDynamicSizeCaculateTypeSize) {
    NSLayoutAttribute attribute = caculateType == ARDynamicSizeCaculateTypeWidth
                                      ? NSLayoutAttributeWidth
                                      : NSLayoutAttributeHeight;
    NSLayoutConstraint *tempConstraint =
        [NSLayoutConstraint constraintWithItem:cell.contentView
                                     attribute:attribute
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1
                                      constant:fixedValue];
    [cell.contentView addConstraint:tempConstraint];
    size = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    [cell.contentView removeConstraint:tempConstraint];
  } else {
    size = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
  }

  NSMutableArray *sectionCache = [self sizeCache][indexPath.section];
  NSValue *sizeValue = [NSValue valueWithCGSize:size];
  if (hasCache) {
    [sectionCache replaceObjectAtIndex:indexPath.row withObject:sizeValue];
  } else {
    [sectionCache insertObject:sizeValue atIndex:indexPath.row];
  }
  return size;
}

#pragma mark - swizzled methods

- (void)ar_registerClass:(Class)cellClass
    forCellWithReuseIdentifier:(NSString *)identifier {
  [self ar_registerClass:cellClass forCellWithReuseIdentifier:identifier];

  id cell = [[cellClass alloc] initWithFrame:CGRectZero];
  NSMutableDictionary *templeCells = [self templeCells];
  templeCells[identifier] = cell;
}

- (void)ar_registerNib:(UINib *)nib
    forCellWithReuseIdentifier:(NSString *)identifier {
  [self ar_registerNib:nib forCellWithReuseIdentifier:identifier];
  id cell = [[nib instantiateWithOwner:nil options:nil] lastObject];
  NSMutableDictionary *templeCells = [self templeCells];
  templeCells[identifier] = cell;
}

#pragma mark - section changes

- (void)ar_reloadSections:(NSIndexSet *)sections {
  [sections enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
    [[self sizeCache] replaceObjectAtIndex:idx withObject:@[].mutableCopy];
  }];
  [self ar_reloadSections:sections];
}

- (void)ar_deleteSections:(NSIndexSet *)sections {
  [sections enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
    [[self sizeCache] removeObjectAtIndex:idx];
  }];
  [self ar_deleteSections:sections];
}

- (void)ar_moveSection:(NSInteger)section toSection:(NSInteger)newSection {
  [[self sizeCache] exchangeObjectAtIndex:section withObjectAtIndex:newSection];
  [self ar_moveSection:section toSection:newSection];
}

#pragma mark - item changes

- (void)ar_deleteItemsAtIndexPaths:(NSArray *)indexPaths {
  [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath *obj, NSUInteger idx,
                                           BOOL *stop) {
    NSMutableArray *section = [self sizeCache][obj.section];
    [section removeObjectAtIndex:obj.row];
  }];
  [self ar_deleteItemsAtIndexPaths:indexPaths];
}

- (void)ar_reloadItemsAtIndexPaths:(NSArray *)indexPaths {
  [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath *obj, NSUInteger idx,
                                           BOOL *stop) {
    if ([self.sizeCache count] > obj.section) {
      NSMutableArray *section = [self sizeCache][obj.section];
      section[obj.row] = ARLayoutCellInvalidateValue;
    }
  }];
  [self ar_reloadItemsAtIndexPaths:indexPaths];
}

- (void)ar_moveItemAtIndexPath:(NSIndexPath *)indexPath
                   toIndexPath:(NSIndexPath *)newIndexPath {
  if ([self hasCacheAtIndexPath:indexPath] &&
      [self hasCacheAtIndexPath:newIndexPath]) {
    NSValue *indexPathSizeValue = [self sizeCacheAtIndexPath:indexPath];
    NSValue *newIndexPathSizeValue = [self sizeCacheAtIndexPath:newIndexPath];

    NSMutableArray *section1 = [self sizeCache][indexPath.section];
    NSMutableArray *section2 = [self sizeCache][newIndexPath.section];
    [section1 replaceObjectAtIndex:indexPath.row
                        withObject:newIndexPathSizeValue];
    [section2 replaceObjectAtIndex:newIndexPath.row
                        withObject:indexPathSizeValue];
  }
  [self ar_moveItemAtIndexPath:indexPath toIndexPath:newIndexPath];
}

- (void)ar_reloadData {
  [[self sizeCache] removeAllObjects];
  [self ar_reloadData];
}

#pragma mark - private methods

- (NSMutableDictionary *)templeCells {
  NSMutableDictionary *templeCells = objc_getAssociatedObject(self, _cmd);
  if (templeCells == nil) {
    templeCells = @{}.mutableCopy;
    objc_setAssociatedObject(self, _cmd, templeCells,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }
  return templeCells;
}

- (id)templeCaculateCellWithIdentifier:(NSString *)identifier {
  NSMutableDictionary *templeCells = [self templeCells];
  id cell = [templeCells objectForKey:identifier];
  if (cell == nil) {
    NSDictionary *cellNibDict = [self valueForKey:@"_cellNibDict"];
    UINib *cellNIb = cellNibDict[identifier];
    cell = [[cellNIb instantiateWithOwner:nil options:nil] lastObject];
    templeCells[identifier] = cell;
  }

  return cell;
}

#pragma mark - cache methods

- (NSMutableArray *)sizeCache {
  NSMutableArray *cache = objc_getAssociatedObject(self, _cmd);
  if (cache == nil) {
    cache = @[].mutableCopy;
    objc_setAssociatedObject(self, _cmd, cache, OBJC_ASSOCIATION_RETAIN);
  }
  return cache;
}

- (BOOL)hasCacheAtIndexPath:(NSIndexPath *)indexPath {
  BOOL hasCache = NO;
  NSMutableArray *cacheArray = [self sizeCache];
  if (cacheArray.count > indexPath.section) {
    if ([cacheArray[indexPath.section] count] > indexPath.row) {
      hasCache = YES;
    }
  } else {
    NSUInteger index = cacheArray.count;
    for (; index < indexPath.section + 1; index++) {
      [cacheArray addObject:@[].mutableCopy];
    }
  }

  return hasCache;
}

- (NSValue *)sizeCacheAtIndexPath:(NSIndexPath *)indexPath {
  NSValue *sizeValue = [self sizeCache][indexPath.section][indexPath.row];
  return sizeValue;
}

@end
