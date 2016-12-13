//
//  SPKUser+CoreDataProperties.h
//  CoreDataPractice
//
//  Created by SPK_Antony on 13/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//

#import "SPKUser+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SPKUser (CoreDataProperties)

+ (NSFetchRequest<SPKUser *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSData *achievements;
@property (nullable, nonatomic, retain) NSData *allHistoryDataPackets;
@property (nullable, nonatomic, retain) NSObject *color;
@property (nullable, nonatomic, retain) NSObject *icon;
@property (nullable, nonatomic, retain) NSObject *imgeRect;
@property (nullable, nonatomic, retain) NSObject *userWeightUnit;

@end

NS_ASSUME_NONNULL_END
