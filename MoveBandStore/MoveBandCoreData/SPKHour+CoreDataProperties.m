//
//  SPKHour+CoreDataProperties.m
//  MoveBandCoreData
//
//  Created by SPK_Antony on 30/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKHour+CoreDataProperties.h"

@implementation SPKHour (CoreDataProperties)

+ (NSFetchRequest<SPKHour *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SPKHour"];
}

@dynamic calories;
@dynamic distance;
@dynamic duration;
@dynamic endTimeStamp;
@dynamic isPast;
@dynamic isUploadedServer;
@dynamic startTimeStamp;
@dynamic steps;

@end
