//
//  SPKPackets+CoreDataProperties.m
//  MoveBandCoreData
//
//  Created by SPK_Antony on 28/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKPackets+CoreDataProperties.h"

@implementation SPKPackets (CoreDataProperties)

+ (NSFetchRequest<SPKPackets *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SPKPackets"];
}

@dynamic isDealtForDay;
@dynamic isDealtForHour;
@dynamic index;
@dynamic startTimeStamp;
@dynamic endTimeStamp;
@dynamic steps;
@dynamic calories;
@dynamic distance;
@dynamic sleep;
@dynamic duration;
@dynamic isUploadedServer;
@dynamic owner;

@end
