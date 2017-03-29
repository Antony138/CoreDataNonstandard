//
//  SPKPackets+CoreDataProperties.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 29/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKPackets+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SPKPackets (CoreDataProperties)

+ (NSFetchRequest<SPKPackets *> *)fetchRequest;

@property (nonatomic) int32_t calories;
@property (nonatomic) int32_t distance;
@property (nonatomic) int32_t duration;
@property (nonatomic) int32_t endTimeStamp;
@property (nonatomic) int64_t index;
@property (nonatomic) BOOL isDealtForDay;
@property (nonatomic) BOOL isDealtForHour;
@property (nonatomic) BOOL isUploadedServer;
@property (nonatomic) int32_t sleep;
@property (nonatomic) int32_t startTimeStamp;
@property (nonatomic) int32_t steps;
@property (nullable, nonatomic, retain) SPKUser *owner;

@end

NS_ASSUME_NONNULL_END
