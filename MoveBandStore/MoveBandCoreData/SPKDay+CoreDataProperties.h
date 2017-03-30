//
//  SPKDay+CoreDataProperties.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 30/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKDay+CoreDataClass.h"
#import "SPKHour+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPKDay (CoreDataProperties)

+ (NSFetchRequest<SPKDay *> *)fetchRequest;

@property (nonatomic) int64_t awakeDuration;
@property (nonatomic) int64_t calories;
@property (nonatomic) int64_t deepSleepDuration;
@property (nonatomic) int64_t distance;
@property (nonatomic) int64_t duration;
@property (nonatomic) int64_t endTimeStamp;
@property (nonatomic) BOOL isCalculateSleep;
@property (nonatomic) int64_t lightSleepDuration;
@property (nonatomic) int64_t startTimeStamp;
@property (nonatomic) int64_t steps;
@property (nullable, nonatomic, retain) NSOrderedSet<SPKHour *> *hours;

@end

@interface SPKDay (CoreDataGeneratedAccessors)

- (void)insertObject:(SPKHour *)value inHoursAtIndex:(NSUInteger)idx;
- (void)removeObjectFromHoursAtIndex:(NSUInteger)idx;
- (void)insertHours:(NSArray<SPKHour *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeHoursAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInHoursAtIndex:(NSUInteger)idx withObject:(SPKHour *)value;
- (void)replaceHoursAtIndexes:(NSIndexSet *)indexes withHours:(NSArray<SPKHour *> *)values;
- (void)addHoursObject:(SPKHour *)value;
- (void)removeHoursObject:(SPKHour *)value;
- (void)addHours:(NSOrderedSet<SPKHour *> *)values;
- (void)removeHours:(NSOrderedSet<SPKHour *> *)values;

@end

NS_ASSUME_NONNULL_END
