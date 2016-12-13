//
//  SPKHistoryDataPacket+CoreDataProperties.h
//  CoreDataPractice
//
//  Created by SPK_Antony on 13/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "SPKHistoryDataPacket+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SPKHistoryDataPacket (CoreDataProperties)

+ (NSFetchRequest<SPKHistoryDataPacket *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *endTimeStamp;
@property (nullable, nonatomic, copy) NSDate *startTimeStamp;
@property (nonatomic) BOOL isUpload;
@property (nonatomic) int16_t steps;
@property (nullable, nonatomic, retain) SPKUser *user;

@end

NS_ASSUME_NONNULL_END
