//
//  SPKDay+CoreDataProperties.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 29/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKDay+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SPKDay (CoreDataProperties)

+ (NSFetchRequest<SPKDay *> *)fetchRequest;

@property (nonatomic) int64_t startTimeStamp;
@property (nonatomic) int64_t steps;
@property (nonatomic) int64_t endTimeStamp;
@property (nonatomic) int64_t calories;
@property (nonatomic) int64_t distance;
@property (nonatomic) int64_t duration;
@property (nonatomic) int64_t deepSleepDuration;
@property (nonatomic) int64_t lightSleepDuration;
@property (nonatomic) int64_t awakeDuration;
@property (nonatomic) BOOL isCalculateSleep;

@end

NS_ASSUME_NONNULL_END
