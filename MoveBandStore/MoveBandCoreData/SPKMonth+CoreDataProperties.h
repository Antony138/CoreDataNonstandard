//
//  SPKMonth+CoreDataProperties.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 30/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKMonth+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SPKMonth (CoreDataProperties)

+ (NSFetchRequest<SPKMonth *> *)fetchRequest;

@property (nonatomic) int64_t startTimeStamp;
@property (nonatomic) int64_t endTimeStamp;
@property (nonatomic) int64_t steps;
@property (nonatomic) int64_t calories;
@property (nonatomic) int64_t distance;
@property (nonatomic) int64_t duration;
@property (nonatomic) int64_t deepSleepDuration;
@property (nonatomic) int64_t lightSleepDuration;
@property (nonatomic) int64_t awakeDuration;
@property (nullable, nonatomic, retain) NSOrderedSet<SPKDay *> *days;

@end

@interface SPKMonth (CoreDataGeneratedAccessors)

- (void)insertObject:(SPKDay *)value inDaysAtIndex:(NSUInteger)idx;
- (void)removeObjectFromDaysAtIndex:(NSUInteger)idx;
- (void)insertDays:(NSArray<SPKDay *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeDaysAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInDaysAtIndex:(NSUInteger)idx withObject:(SPKDay *)value;
- (void)replaceDaysAtIndexes:(NSIndexSet *)indexes withDays:(NSArray<SPKDay *> *)values;
- (void)addDaysObject:(SPKDay *)value;
- (void)removeDaysObject:(SPKDay *)value;
- (void)addDays:(NSOrderedSet<SPKDay *> *)values;
- (void)removeDays:(NSOrderedSet<SPKDay *> *)values;

@end

NS_ASSUME_NONNULL_END
