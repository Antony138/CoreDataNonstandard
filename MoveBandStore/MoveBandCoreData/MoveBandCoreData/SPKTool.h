//
//  SPKTool.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 30/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPKTool : NSObject

+ (NSInteger)getTodayStartTimeStamp;

+ (NSInteger)getTodayEndTimeStamp;

+ (NSInteger)getCurrentWeekStartTimeStamp;

+ (NSInteger)getCurrentWeekEndTimeStamp;

+ (NSInteger)getStartTimeStampForMonth:(NSInteger)monthIndex;

+ (NSInteger)getEndTimeStampForMonth:(NSInteger)monthIndex;

+ (NSInteger)getDaysAmonutInMonthStartTimeStamp:(NSInteger)startTimeStamp;

@end
