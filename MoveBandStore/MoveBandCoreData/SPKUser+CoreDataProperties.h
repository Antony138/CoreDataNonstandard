//
//  SPKUser+CoreDataProperties.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 28/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKUser+CoreDataClass.h"
#import "SPKPackets+CoreDataClass.h"
#import "SPKPublic.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPKUser (CoreDataProperties)

+ (NSFetchRequest<SPKUser *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSMutableArray *allHistoryDataPackets;
@property (nonatomic) BOOL isFirstLogin;
@property (nonatomic) BOOL isLogined;
@property (nonatomic) BOOL isShouldAutoLogin;
@property (nonatomic) BOOL isThirdPartyPlatform;
@property (nonatomic) BOOL isWholeProfile;
@property (nullable, nonatomic, copy) NSDate *lastSyncDate;
@property (nullable, nonatomic, copy) NSString *onlinePhotoUrl;
@property (nullable, nonatomic, copy) NSString *thirdPartyPlatformType;
@property (nullable, nonatomic, copy) NSString *uid;
@property (nonatomic) int16_t userAge;
@property (nullable, nonatomic, copy) NSDate *userBirthdayDate;
@property (nonatomic) int16_t userBirthdayTimeStamp;
@property (nullable, nonatomic, copy) NSString *userEmailAccount;
@property (nonatomic) UserGenderType userGender;
@property (nonatomic) int16_t userGoalCalories;
@property (nonatomic) int16_t userGoalDistence;
@property (nonatomic) int16_t userGoalDuration;
@property (nonatomic) int16_t userGoalSteps;
@property (nonatomic) int16_t userHeight;
@property (nonatomic) int16_t userID;
@property (nullable, nonatomic, copy) NSString *userName;
@property (nullable, nonatomic, copy) NSString *userPassword;
@property (nullable, nonatomic, copy) NSString *userPhotoKey;
@property (nullable, nonatomic, copy) NSString *userPhotoMD5Value;
@property (nonatomic) int16_t userWeight;
@property (nullable, nonatomic, retain) NSSet<SPKPackets *> *allPackets;

@end

@interface SPKUser (CoreDataGeneratedAccessors)

- (void)addAllPacketsObject:(SPKPackets *)value;
- (void)removeAllPacketsObject:(SPKPackets *)value;
- (void)addAllPackets:(NSSet<SPKPackets *> *)values;
- (void)removeAllPackets:(NSSet<SPKPackets *> *)values;

@end

NS_ASSUME_NONNULL_END
