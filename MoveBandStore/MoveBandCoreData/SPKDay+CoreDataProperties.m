//
//  SPKDay+CoreDataProperties.m
//  MoveBandCoreData
//
//  Created by SPK_Antony on 30/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKDay+CoreDataProperties.h"

@implementation SPKDay (CoreDataProperties)

+ (NSFetchRequest<SPKDay *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SPKDay"];
}

@dynamic awakeDuration;
@dynamic calories;
@dynamic deepSleepDuration;
@dynamic distance;
@dynamic duration;
@dynamic endTimeStamp;
@dynamic isCalculateSleep;
@dynamic lightSleepDuration;
@dynamic startTimeStamp;
@dynamic steps;
@dynamic hours;

@end
