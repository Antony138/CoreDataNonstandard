//
//  SPKUser+CoreDataProperties.m
//  CoreDataPractice
//
//  Created by SPK_Antony on 13/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//

#import "SPKUser+CoreDataProperties.h"

@implementation SPKUser (CoreDataProperties)

+ (NSFetchRequest<SPKUser *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SPKUser"];
}

@dynamic achievements;
@dynamic allHistoryDataPackets;
@dynamic color;
@dynamic icon;
@dynamic imgeRect;
@dynamic userWeightUnit;

@end
