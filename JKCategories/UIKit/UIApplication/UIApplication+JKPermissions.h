//
//  UIApplication-Permissions.h
//  UIApplication-Permissions Sample
//
//  Created by Jack Rostron on 12/01/2014.
//  Copyright (c) 2014 Rostron. All rights reserved.
//  https://github.com/JackRostron/UIApplication-Permissions
//   Category on UIApplication that adds permission helpers


#import <UIKit/UIKit.h>

#import <CoreLocation/CoreLocation.h>

typedef enum {
    JKPermissionTypeBluetoothLE,
    JKPermissionTypeCalendar,
    JKPermissionTypeContacts,
    JKPermissionTypeLocation,
    JKPermissionTypeMicrophone,
    JKPermissionTypeMotion,
    JKPermissionTypePhotos,
    JKPermissionTypeReminders,
} JKPermissionType;

typedef enum {
    JKPermissionAccessDenied, //User has rejected feature
    JKPermissionAccessGranted, //User has accepted feature
    JKPermissionAccessRestricted, //Blocked by parental controls or system settings
    JKPermissionAccessUnknown, //Cannot be determined
    JKPermissionAccessUnsupported, //Device doesn't support this - e.g Core Bluetooth
    JKPermissionAccessMissingFramework, //Developer didn't import the required framework to the project
} JKPermissionAccess;

@interface UIApplication (JKPermissions)

//Check permission of service. Cannot check microphone or motion without asking user for permission
-(JKPermissionAccess)jk_hasAccessToBluetoothLE;
-(JKPermissionAccess)jk_hasAccessToCalendar;
-(JKPermissionAccess)jk_hasAccessToContacts;
-(JKPermissionAccess)jk_hasAccessToLocation;
-(JKPermissionAccess)jk_hasAccessToPhotos;
-(JKPermissionAccess)jk_hasAccessToReminders;

//Request permission with callback
-(void)jk_requestAccessToCalendarWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied;
-(void)jk_requestAccessToContactsWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied;
-(void)jk_requestAccessToMicrophoneWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied;
-(void)jk_requestAccessToPhotosWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied;
-(void)jk_requestAccessToRemindersWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied;

//Instance methods
-(void)jk_requestAccessToLocationWithSuccess:(void(^)(void))accessGranted andFailure:(void(^)(void))accessDenied;

//No failure callback available
-(void)jk_requestAccessToMotionWithSuccess:(void(^)(void))accessGranted;

//Needs investigating - unsure whether it can be implemented because of required delegate callbacks
//-(void)requestAccessToBluetoothLEWithSuccess:(void(^)())accessGranted;

@end
