//
//  SPKUser+CoreDataProperties.m
//  MoveBandCoreData
//
//  Created by SPK_Antony on 29/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKUser+CoreDataProperties.h"

@implementation SPKUser (CoreDataProperties)

+ (NSFetchRequest<SPKUser *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SPKUser"];
}

@dynamic allHistoryDataPackets;
@dynamic isFirstLogin;
@dynamic isLogined;
@dynamic isShouldAutoLogin;
@dynamic isThirdPartyPlatform;
@dynamic isWholeProfile;
@dynamic lastSyncDate;
@dynamic onlinePhotoUrl;
@dynamic thirdPartyPlatformType;
@dynamic uid;
@dynamic userAge;
@dynamic userBirthdayDate;
@dynamic userBirthdayTimeStamp;
@dynamic userEmailAccount;
@dynamic userGender;
@dynamic userGoalCalories;
@dynamic userGoalDistence;
@dynamic userGoalDuration;
@dynamic userGoalSteps;
@dynamic userHeight;
@dynamic userID;
@dynamic userName;
@dynamic userPassword;
@dynamic userPhotoKey;
@dynamic userPhotoMD5Value;
@dynamic userWeight;
@dynamic allPackets;

@end
