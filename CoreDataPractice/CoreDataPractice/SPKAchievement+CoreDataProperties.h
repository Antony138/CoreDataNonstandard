//
//  SPKAchievement+CoreDataProperties.h
//  CoreDataPractice
//
//  Created by SPK_Antony on 13/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "SPKAchievement+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SPKAchievement (CoreDataProperties)

+ (NSFetchRequest<SPKAchievement *> *)fetchRequest;

@property (nonatomic) int16_t completeDegree;
@property (nonatomic) BOOL isReach;
@property (nullable, nonatomic, copy) NSDate *reachedDate;
@property (nonatomic) int16_t type;
@property (nullable, nonatomic, retain) SPKUser *user;

@end

NS_ASSUME_NONNULL_END
