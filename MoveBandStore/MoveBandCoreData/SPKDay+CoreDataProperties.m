//
//  SPKDay+CoreDataProperties.m
//  MoveBandCoreData
//
//  Created by SPK_Antony on 29/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKDay+CoreDataProperties.h"

@implementation SPKDay (CoreDataProperties)

+ (NSFetchRequest<SPKDay *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SPKDay"];
}

@dynamic startTimeStamp;
@dynamic steps;
@dynamic endTimeStamp;
@dynamic calories;
@dynamic distance;
@dynamic duration;
@dynamic deepSleepDuration;
@dynamic lightSleepDuration;
@dynamic awakeDuration;
@dynamic isCalculateSleep;

@end
