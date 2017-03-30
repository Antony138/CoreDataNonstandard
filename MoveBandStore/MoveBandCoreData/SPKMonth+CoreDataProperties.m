//
//  SPKMonth+CoreDataProperties.m
//  MoveBandCoreData
//
//  Created by SPK_Antony on 30/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKMonth+CoreDataProperties.h"

@implementation SPKMonth (CoreDataProperties)

+ (NSFetchRequest<SPKMonth *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SPKMonth"];
}

@dynamic startTimeStamp;
@dynamic endTimeStamp;
@dynamic steps;
@dynamic calories;
@dynamic distance;
@dynamic duration;
@dynamic deepSleepDuration;
@dynamic lightSleepDuration;
@dynamic awakeDuration;
@dynamic days;

@end
