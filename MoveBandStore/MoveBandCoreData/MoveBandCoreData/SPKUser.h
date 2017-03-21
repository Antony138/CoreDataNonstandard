//
//  SPKUser.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 21/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface SPKUser : NSManagedObject

#pragma mark - 个人信息相关
/// 保存照片的key(其实和userAccount一样:因为用userAccount做为key)
@property (copy, nonatomic) NSString *userPhotoKey;

/// 用户头像文件的MD5值(下载的时候需要传这个参数)(这个值是用户上传头像时,服务器生成的)
@property (copy, nonatomic) NSString *userPhotoMD5Value;

@property (nonatomic) uint16_t userID;

@property (copy, nonatomic) NSString *userName;

@property (nonatomic) uint16_t userWeight;

@property (nonatomic) uint16_t userHeight;

@property (strong, nonatomic) NSDate *userBirthdayDate;

@property (nonatomic) uint16_t userAge;

@property (nonatomic) uint16_t userBirthdayTimeStamp;

@property (nonatomic) BOOL isWholeProfile;

/// 第三方登录的uid(唯一识别码?)
@property (copy, nonatomic) NSString *uid;

/// 第三方登录时拿到的头像链接
@property (copy, nonatomic) NSString *onlinePhotoUrl;

@property (copy, nonatomic) NSString *thirdPartyPlatformType;

#pragma mark - 登录相关
@property (nonatomic) BOOL isShouldAutoLogin;

@property (nonatomic) BOOL isLogined;

@property (nonatomic) BOOL isFirstLogin;

@property (copy, nonatomic) NSString *userEmailAccount;

@property (copy, nonatomic) NSString *userPassword;

@property (nonatomic) BOOL isThirdPartyPlatform;

#pragma mark - 运动数据相关

#pragma mark 上次同步历史数据的时间
/// 上次同步历史数据的时间(用于判断是否需要同步历史数据(超过15分钟就需要))
@property (strong, nonatomic) NSDate *lastSyncDate;

#pragma mark 个人目标
@property (nonatomic) uint16_t userGoalSteps;























@end
