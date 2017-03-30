//
//  SPKTool.m
//  MoveBandCoreData
//
//  Created by SPK_Antony on 30/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKTool.h"

@implementation SPKTool

#pragma mark - Help Methods
// 获取"今天"的开始时间戳
+ (NSInteger)getTodayStartTimeStamp {
    
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [currentCalendar components:( NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitDay |NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:[NSDate date]];
    
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    
    // 获取今天开始的时间戳
    return [[currentCalendar dateFromComponents:components] timeIntervalSince1970];
}

+ (NSInteger)getTodayEndTimeStamp {
    return [self getTodayStartTimeStamp] + 86400;
}

@end
