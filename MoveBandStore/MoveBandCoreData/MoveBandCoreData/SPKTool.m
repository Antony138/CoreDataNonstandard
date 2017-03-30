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

+ (NSInteger)getCurrentWeekStartTimeStamp {
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    
    NSDate *now = [NSDate date];
    
    NSDate *startDateOfCurrentWeek;
    NSDate *endDateOfCurrentWeek;
    
    NSTimeInterval interval;
    
    [currentCalendar rangeOfUnit:NSCalendarUnitWeekOfYear
                       startDate:&startDateOfCurrentWeek
                        interval:&interval
                         forDate:now];
    
    endDateOfCurrentWeek = [startDateOfCurrentWeek dateByAddingTimeInterval:interval];
    
    return [startDateOfCurrentWeek timeIntervalSince1970];
}

+ (NSInteger)getCurrentWeekEndTimeStamp {
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    
    NSDate *now = [NSDate date];
    
    NSDate *startDateOfCurrentWeek;
    NSDate *endDateOfCurrentWeek;
    
    NSTimeInterval interval;
    
    [currentCalendar rangeOfUnit:NSCalendarUnitWeekOfYear
                       startDate:&startDateOfCurrentWeek
                        interval:&interval
                         forDate:now];
    
    endDateOfCurrentWeek = [startDateOfCurrentWeek dateByAddingTimeInterval:interval];
    
    return [endDateOfCurrentWeek timeIntervalSince1970];
}

+ (NSInteger)getStartTimeStampForMonth:(NSInteger)monthIndex {
    // 1、根据i值，拿到所有月的起始日(NSDate对象)
    // 1.1、拿到当前月份的起始日
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    
    NSDate *now = [NSDate date];
    NSDate *startDateOfCurrentMonth;
    
    NSTimeInterval interval;
    [currentCalendar rangeOfUnit:NSCalendarUnitMonth
                       startDate:&startDateOfCurrentMonth
                        interval:&interval
                         forDate:now];
    
    // 1.2、根据monthInex，得到对应月份起始日的年、月、日
    NSDateComponents *comps = [NSDateComponents new];
    // (UI选择月份的monthInex和这里的索引刚好相反,11-monthInex得出0~11的索引)
    comps.month = monthIndex;
    
    NSDate *fromDate = [currentCalendar dateByAddingComponents:comps
                                                        toDate:startDateOfCurrentMonth
                                                       options:0];
    NSDateComponents *components = [currentCalendar components:NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitYear
                                                      fromDate:fromDate]; // Get necessary date components
    
    // 1.3、根据年月日，创建NSDate对象
    NSDate *firstDayOfMonth = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    
    
    // 2、根据NSData对象,计算出起始日及结束日的时间戳
    NSDate *startDateOfTheMonth;
    NSDate *endDateOfTheMonth;
    
    [currentCalendar rangeOfUnit:NSCalendarUnitMonth
                       startDate:&startDateOfTheMonth
                        interval:&interval
                         forDate:firstDayOfMonth];
    
    endDateOfTheMonth = [startDateOfTheMonth dateByAddingTimeInterval:interval];
    
    return [startDateOfTheMonth timeIntervalSince1970];
}

+ (NSInteger)getEndTimeStampForMonth:(NSInteger)monthIndex {
    // 1、根据i值，拿到所有月的起始日(NSDate对象)
    // 1.1、拿到当前月份的起始日
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    
    NSDate *now = [NSDate date];
    NSDate *startDateOfCurrentMonth;
    
    NSTimeInterval interval;
    [currentCalendar rangeOfUnit:NSCalendarUnitMonth
                       startDate:&startDateOfCurrentMonth
                        interval:&interval
                         forDate:now];
    
    // 1.2、根据monthInex，得到对应月份起始日的年、月、日
    NSDateComponents *comps = [NSDateComponents new];
    // (UI选择月份的monthInex和这里的索引刚好相反,11-monthInex得出0~11的索引)
    comps.month = monthIndex;
    
    NSDate *fromDate = [currentCalendar dateByAddingComponents:comps
                                                        toDate:startDateOfCurrentMonth
                                                       options:0];
    NSDateComponents *components = [currentCalendar components:NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitYear
                                                      fromDate:fromDate]; // Get necessary date components
    
    // 1.3、根据年月日，创建NSDate对象
    NSDate *firstDayOfMonth = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    
    
    // 2、根据NSData对象,计算出起始日及结束日的时间戳
    NSDate *startDateOfTheMonth;
    NSDate *endDateOfTheMonth;
    
    [currentCalendar rangeOfUnit:NSCalendarUnitMonth
                       startDate:&startDateOfTheMonth
                        interval:&interval
                         forDate:firstDayOfMonth];
    
    endDateOfTheMonth = [startDateOfTheMonth dateByAddingTimeInterval:interval];
    
    return [endDateOfTheMonth timeIntervalSince1970];
}

+ (NSInteger)getDaysAmonutInMonthStartTimeStamp:(NSInteger)startTimeStamp {
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange daysRange = [gregorian rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate dateWithTimeIntervalSince1970:startTimeStamp]];
    NSUInteger daysAmonut = daysRange.length;
    
    return daysAmonut;
}

@end
