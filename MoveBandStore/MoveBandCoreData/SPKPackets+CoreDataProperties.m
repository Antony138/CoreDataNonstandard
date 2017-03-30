//
//  SPKPackets+CoreDataProperties.m
//  MoveBandCoreData
//
//  Created by SPK_Antony on 30/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKPackets+CoreDataProperties.h"

@implementation SPKPackets (CoreDataProperties)

+ (NSFetchRequest<SPKPackets *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SPKPackets"];
}

@dynamic calories;
@dynamic distance;
@dynamic duration;
@dynamic endTimeStamp;
@dynamic index;
@dynamic isDealtForDay;
@dynamic isDealtForHour;
@dynamic isUploadedServer;
@dynamic sleep;
@dynamic startTimeStamp;
@dynamic steps;

@end
