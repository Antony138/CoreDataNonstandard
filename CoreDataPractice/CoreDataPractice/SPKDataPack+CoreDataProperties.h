//
//  SPKDataPack+CoreDataProperties.h
//  CoreDataPractice
//
//  Created by SPK_Antony on 17/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//

#import "SPKDataPack+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SPKDataPack (CoreDataProperties)

+ (NSFetchRequest<SPKDataPack *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *startTimeStamp;
@property (nullable, nonatomic, copy) NSDate *endTimeStamp;
@property (nonatomic) int16_t steps;
@property (nonatomic) BOOL isUploadedServer;
@property (nullable, nonatomic, retain) SPKUser *owenr;

@end

NS_ASSUME_NONNULL_END
