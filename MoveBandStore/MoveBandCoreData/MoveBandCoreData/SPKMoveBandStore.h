//
//  SPKMoveBandStore.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 21/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;
@class SPKUser;

@interface SPKMoveBandStore : NSObject

@property (strong, nonatomic) NSManagedObjectContext *context;

// 这里返回SPKUser, 是为了传递给其他页面, 以便进行赋值
// pass SPKUser to other controllers for assign value
- (SPKUser *)addNewUser;

- (void)removeUser:(SPKUser *)user;

- (void)save;

@end
