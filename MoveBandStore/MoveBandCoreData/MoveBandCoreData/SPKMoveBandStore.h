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
@class SPKMonth;

@interface SPKMoveBandStore : NSObject

@property (strong, nonatomic) NSManagedObjectContext *context;

// 这里返回SPKUser, 是为了传递给其他页面, 以便进行赋值
// return SPKUser to other controllers for assign value
- (SPKUser *)addNewUser;

// 利用NSEntityDescription的insert方法添加一个历史数据包(到对应的User中)
- (void)addPacketFor:(SPKUser *)user
           withIndex:(int64_t)index
      startTimeStamp:(int32_t)startTimeStamp
        endTimeStamp:(int32_t)endTimeStamp
               steps:(int32_t)steps
            calories:(int32_t)calories
            distance:(int32_t)distance
               sleep:(int32_t)sleep
            duration:(int32_t)duration
    isUploadedServer:(BOOL)isUploadedServer;

- (void)addMonthFor:(SPKUser *)user
 withStartTimeStamp:(int64_t)startTimeStamp
       endTimeStamp:(int64_t)endTimeStamp
              steps:(int64_t)steps
           calories:(int64_t)calories
           distance:(int64_t)distance
           duration:(int64_t)duration
  deepSleepDuration:(int64_t)deepSleepDuration
 lightSleepDuration:(int64_t)lightSleepDuration
      awakeDuration:(int64_t)awakeDuration;

- (void)removeUser:(SPKUser *)user;

- (void)save;

@end
