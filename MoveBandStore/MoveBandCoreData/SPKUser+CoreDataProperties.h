//
//  SPKUser+CoreDataProperties.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 29/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKUser+CoreDataClass.h"
#import "SPKPackets+CoreDataClass.h"
#import "SPKDay+CoreDataClass.h"
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
@property (nullable, nonatomic, retain) NSOrderedSet<SPKDay *> *allDays;

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

- (void)insertObject:(SPKDay *)value inAllDaysAtIndex:(NSUInteger)idx;
- (void)removeObjectFromAllDaysAtIndex:(NSUInteger)idx;
- (void)insertAllDays:(NSArray<SPKDay *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeAllDaysAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInAllDaysAtIndex:(NSUInteger)idx withObject:(SPKDay *)value;
- (void)replaceAllDaysAtIndexes:(NSIndexSet *)indexes withAllDays:(NSArray<SPKDay *> *)values;
- (void)addAllDaysObject:(SPKDay *)value;
- (void)removeAllDaysObject:(SPKDay *)value;
- (void)addAllDays:(NSOrderedSet<SPKDay *> *)values;
- (void)removeAllDays:(NSOrderedSet<SPKDay *> *)values;

@end

NS_ASSUME_NONNULL_END
