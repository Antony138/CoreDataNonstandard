//
//  SPKDataPack+CoreDataProperties.m
//  CoreDataPractice
//
//  Created by SPK_Antony on 17/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//

#import "SPKDataPack+CoreDataProperties.h"

@implementation SPKDataPack (CoreDataProperties)

+ (NSFetchRequest<SPKDataPack *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SPKDataPack"];
}

@dynamic startTimeStamp;
@dynamic endTimeStamp;
@dynamic steps;
@dynamic isUploadedServer;
@dynamic owenr;

@end
