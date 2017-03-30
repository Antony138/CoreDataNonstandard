//
//  SPKUser+CoreDataProperties.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 30/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKUser+CoreDataClass.h"
#import "SPKPackets+CoreDataClass.h"
#import "SPKMonth+CoreDataClass.h"
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
@property (nullable, nonatomic, retain) NSOrderedSet<SPKPackets *> *allPackets;
@property (nullable, nonatomic, retain) NSOrderedSet<SPKMonth *> *months;

@end

@interface SPKUser (CoreDataGeneratedAccessors)

- (void)insertObject:(SPKPackets *)value inAllPacketsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromAllPacketsAtIndex:(NSUInteger)idx;
- (void)insertAllPackets:(NSArray<SPKPackets *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeAllPacketsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInAllPacketsAtIndex:(NSUInteger)idx withObject:(SPKPackets *)value;
- (void)replaceAllPacketsAtIndexes:(NSIndexSet *)indexes withAllPackets:(NSArray<SPKPackets *> *)values;
- (void)addAllPacketsObject:(SPKPackets *)value;
- (void)removeAllPacketsObject:(SPKPackets *)value;
- (void)addAllPackets:(NSOrderedSet<SPKPackets *> *)values;
- (void)removeAllPackets:(NSOrderedSet<SPKPackets *> *)values;

- (void)insertObject:(SPKMonth *)value inMonthsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromMonthsAtIndex:(NSUInteger)idx;
- (void)insertMonths:(NSArray<SPKMonth *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeMonthsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInMonthsAtIndex:(NSUInteger)idx withObject:(SPKMonth *)value;
- (void)replaceMonthsAtIndexes:(NSIndexSet *)indexes withMonths:(NSArray<SPKMonth *> *)values;
- (void)addMonthsObject:(SPKMonth *)value;
- (void)removeMonthsObject:(SPKMonth *)value;
- (void)addMonths:(NSOrderedSet<SPKMonth *> *)values;
- (void)removeMonths:(NSOrderedSet<SPKMonth *> *)values;

@end

NS_ASSUME_NONNULL_END
