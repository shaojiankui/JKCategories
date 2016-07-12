//
//  UIApplication-Permissions.m
//  UIApplication-Permissions Sample
//
//  Created by Jack Rostron on 12/01/2014.
//  Copyright (c) 2014 Rostron. All rights reserved.
//

#import "UIApplication+JKPermissions.h"
#import <objc/runtime.h>

//Import required frameworks
#import <AddressBook/AddressBook.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>
#import <EventKit/EventKit.h>

typedef void (^JKLocationSuccessCallback)();
typedef void (^JKLocationFailureCallback)();

static char JKPermissionsLocationManagerPropertyKey;
static char JKPermissionsLocationBlockSuccessPropertyKey;
static char JKPermissionsLocationBlockFailurePropertyKey;

@interface UIApplication () <CLLocationManagerDelegate>
@property (nonatomic, retain) CLLocationManager *jk_permissionsLocationManager;
@property (nonatomic, copy) JKLocationSuccessCallback jk_locationSuccessCallbackProperty;
@property (nonatomic, copy) JKLocationFailureCallback jk_locationFailureCallbackProperty;
@end


@implementation UIApplication (Permissions)


#pragma mark - Check permissions
-(JKPermissionAccess)hasAccessToBluetoothLE {
    switch ([[[CBCentralManager alloc] init] state]) {
        case CBCentralManagerStateUnsupported:
            return JKPermissionAccessUnsupported;
            break;
            
        case CBCentralManagerStateUnauthorized:
            return JKPermissionAccessDenied;
            break;
            
        default:
            return JKPermissionAccessGranted;
            break;
    }
}

-(JKPermissionAccess)hasAccessToCalendar {
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent]) {
        case EKAuthorizationStatusAuthorized:
            return JKPermissionAccessGranted;
            break;
            
        case EKAuthorizationStatusDenied:
            return JKPermissionAccessDenied;
            break;
            
        case EKAuthorizationStatusRestricted:
            return JKPermissionAccessRestricted;
            break;
            
        default:
            return JKPermissionAccessUnknown;
            break;
    }
}

-(JKPermissionAccess)hasAccessToContacts {
    switch (ABAddressBookGetAuthorizationStatus()) {
        case kABAuthorizationStatusAuthorized:
            return JKPermissionAccessGranted;
            break;
            
        case kABAuthorizationStatusDenied:
            return JKPermissionAccessDenied;
            break;
            
        case kABAuthorizationStatusRestricted:
            return JKPermissionAccessRestricted;
            break;
            
        default:
            return JKPermissionAccessUnknown;
            break;
    }
}

-(JKPermissionAccess)hasAccessToLocation {
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusAuthorized:
            return JKPermissionAccessGranted;
            break;
            
        case kCLAuthorizationStatusDenied:
            return JKPermissionAccessDenied;
            break;
            
        case kCLAuthorizationStatusRestricted:
            return JKPermissionAccessRestricted;
            break;
            
        default:
            return JKPermissionAccessUnknown;
            break;
    }
    return JKPermissionAccessUnknown;
}

-(JKPermissionAccess)hasAccessToPhotos {
    switch ([ALAssetsLibrary authorizationStatus]) {
        case ALAuthorizationStatusAuthorized:
            return JKPermissionAccessGranted;
            break;
            
        case ALAuthorizationStatusDenied:
            return JKPermissionAccessDenied;
            break;
            
        case ALAuthorizationStatusRestricted:
            return JKPermissionAccessRestricted;
            break;
            
        default:
            return JKPermissionAccessUnknown;
            break;
    }
}

-(JKPermissionAccess)hasAccessToReminders {
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder]) {
        case EKAuthorizationStatusAuthorized:
            return JKPermissionAccessGranted;
            break;
            
        case EKAuthorizationStatusDenied:
            return JKPermissionAccessDenied;
            break;
            
        case EKAuthorizationStatusRestricted:
            return JKPermissionAccessRestricted;
            break;
            
        default:
            return JKPermissionAccessUnknown;
            break;
    }
    return JKPermissionAccessUnknown;
}


#pragma mark - Request permissions
-(void)jk_requestAccessToCalendarWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                accessGranted();
            } else {
                accessDenied();
            }
        });
    }];
}

-(void)jk_requestAccessToContactsWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    if(addressBook) {
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (granted) {
                    accessGranted();
                } else {
                    accessDenied();
                }
            });
        });
    }
}

-(void)jk_requestAccessToMicrophoneWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    AVAudioSession *session = [[AVAudioSession alloc] init];
    [session requestRecordPermission:^(BOOL granted) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                accessGranted();
            } else {
                accessDenied();
            }
        });
    }];
}

-(void)jk_requestAccessToMotionWithSuccess:(void(^)())accessGranted {
    CMMotionActivityManager *motionManager = [[CMMotionActivityManager alloc] init];
    NSOperationQueue *motionQueue = [[NSOperationQueue alloc] init];
    [motionManager startActivityUpdatesToQueue:motionQueue withHandler:^(CMMotionActivity *activity) {
        accessGranted();
        [motionManager stopActivityUpdates];
    }];
}

-(void)jk_requestAccessToPhotosWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        accessGranted();
    } failureBlock:^(NSError *error) {
        accessDenied();
    }];
}

-(void)jk_requestAccessToRemindersWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    [eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                accessGranted();
            } else {
                accessDenied();
            }
        });
    }];
}


#pragma mark - Needs investigating
/*
 -(void)requestAccessToBluetoothLEWithSuccess:(void(^)())accessGranted {
 //REQUIRES DELEGATE - NEEDS RETHINKING
 }
 */

-(void)jk_requestAccessToLocationWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    self.jk_permissionsLocationManager = [[CLLocationManager alloc] init];
    self.jk_permissionsLocationManager.delegate = self;
    
    self.jk_locationSuccessCallbackProperty = accessGranted;
    self.jk_locationFailureCallbackProperty = accessDenied;
    [self.jk_permissionsLocationManager startUpdatingLocation];
}


#pragma mark - Location manager injection
-(CLLocationManager *)jk_permissionsLocationManager {
    return objc_getAssociatedObject(self, &JKPermissionsLocationManagerPropertyKey);
}

-(void)setJk_permissionsLocationManager:(CLLocationManager *)manager {
    objc_setAssociatedObject(self, &JKPermissionsLocationManagerPropertyKey, manager, OBJC_ASSOCIATION_RETAIN);
}

-(JKLocationSuccessCallback)locationSuccessCallbackProperty {
    return objc_getAssociatedObject(self, &JKPermissionsLocationBlockSuccessPropertyKey);
}

-(void)setJk_locationSuccessCallbackProperty:(JKLocationSuccessCallback)locationCallbackProperty {
    objc_setAssociatedObject(self, &JKPermissionsLocationBlockSuccessPropertyKey, locationCallbackProperty, OBJC_ASSOCIATION_COPY);
}

-(JKLocationFailureCallback)locationFailureCallbackProperty {
    return objc_getAssociatedObject(self, &JKPermissionsLocationBlockFailurePropertyKey);
}

-(void)setJk_locationFailureCallbackProperty:(JKLocationFailureCallback)locationFailureCallbackProperty {
    objc_setAssociatedObject(self, &JKPermissionsLocationBlockFailurePropertyKey, locationFailureCallbackProperty, OBJC_ASSOCIATION_COPY);
}


#pragma mark - Location manager delegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorized) {
        self.locationSuccessCallbackProperty();
    } else if (status != kCLAuthorizationStatusNotDetermined) {
        self.locationFailureCallbackProperty();
    }
}

@end
