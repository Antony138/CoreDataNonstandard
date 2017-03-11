//
//  Employee+CoreDataProperties.h
//  UsingCoreData
//
//  Created by SPK_Antony on 11/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "Employee+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest;

@property (nonatomic) int16_t age;
@property (nonatomic) BOOL isFreshman;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSDate *startDate;

@end

NS_ASSUME_NONNULL_END
