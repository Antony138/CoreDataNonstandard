//
//  Employee+CoreDataProperties.m
//  UsingCoreData
//
//  Created by SPK_Antony on 11/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "Employee+CoreDataProperties.h"

@implementation Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
}

@dynamic age;
@dynamic isFreshman;
@dynamic name;
@dynamic startDate;

@end
