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
@property (nullable, nonatomic, retain) NSData *allHistoryDatapackets;
@property (nullable, nonatomic, retain) NSObject *color;
@property (nullable, nonatomic, retain) NSObject *icon;
@property (nullable, nonatomic, retain) NSObject *imageRect;
@property (nullable, nonatomic, retain) NSObject *userWeightUnit;
@property (nullable, nonatomic, retain) NSSet<SPKHistoryDataPacket *> *dataPackets;
@property (nullable, nonatomic, retain) NSSet<SPKAchievement *> *userAchievements;

@end

@interface SPKUser (CoreDataGeneratedAccessors)

- (void)addDataPacketsObject:(SPKHistoryDataPacket *)value;
- (void)removeDataPacketsObject:(SPKHistoryDataPacket *)value;
- (void)addDataPackets:(NSSet<SPKHistoryDataPacket *> *)values;
- (void)removeDataPackets:(NSSet<SPKHistoryDataPacket *> *)values;

- (void)addUserAchievementsObject:(SPKAchievement *)value;
- (void)removeUserAchievementsObject:(SPKAchievement *)value;
- (void)addUserAchievements:(NSSet<SPKAchievement *> *)values;
- (void)removeUserAchievements:(NSSet<SPKAchievement *> *)values;

@end

NS_ASSUME_NONNULL_END
