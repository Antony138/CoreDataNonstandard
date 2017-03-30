//
//  SPKHour+CoreDataProperties.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 30/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKHour+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SPKHour (CoreDataProperties)

+ (NSFetchRequest<SPKHour *> *)fetchRequest;

@property (nonatomic) int64_t startTimeStamp;
@property (nonatomic) int64_t endTimeStamp;
@property (nonatomic) int64_t steps;
@property (nonatomic) int64_t calories;
@property (nonatomic) int64_t distance;
@property (nonatomic) int64_t duration;
@property (nonatomic) BOOL isPast;
@property (nonatomic) BOOL isUploadedServer;

@end

NS_ASSUME_NONNULL_END
