//
//  SPKAchievement+CoreDataProperties.m
//  CoreDataPractice
//
//  Created by SPK_Antony on 13/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "SPKAchievement+CoreDataProperties.h"

@implementation SPKAchievement (CoreDataProperties)

+ (NSFetchRequest<SPKAchievement *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SPKAchievement"];
}

@dynamic completeDegree;
@dynamic isReach;
@dynamic reachedDate;
@dynamic type;
@dynamic user;

@end
