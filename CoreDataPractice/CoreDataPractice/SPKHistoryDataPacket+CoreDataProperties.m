//
//  SPKHistoryDataPacket+CoreDataProperties.m
//  CoreDataPractice
//
//  Created by SPK_Antony on 13/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "SPKHistoryDataPacket+CoreDataProperties.h"

@implementation SPKHistoryDataPacket (CoreDataProperties)

+ (NSFetchRequest<SPKHistoryDataPacket *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SPKHistoryDataPacket"];
}

@dynamic endTimeStamp;
@dynamic startTimeStamp;
@dynamic isUpload;
@dynamic steps;
@dynamic user;

@end
