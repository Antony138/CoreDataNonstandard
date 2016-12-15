//
//  SPKPublic.h
//  OneTouchMove
//
//  Created by Antony on 16/3/19.
//  Copyright © 2016年 Spark Technology Inc. All rights reserved.
//

#ifndef SPKPublic_h
#define SPKPublic_h


#endif /* SPKPublic_h */
#pragma mark - 硬件相关"服务"、"特征"UUID
// OneTouchMove用于读写数据的"服务"UUID字符串:FFF0
static NSString *kOurServiceUUIDString            = @"FFF0";
// OneTouchMove回传数据到APP用到的「特徵」字符串FF02
static NSString *kCharacteristicDataOutUUIDString = @"FFF2";
// OneTouchMove用于数据写入的「特徵」字符串FF01 (8个模块都一样)
static NSString *kCharacteristicDataInUUIDString  = @"FFF1";

// 扫描设备的时间
static NSTimeInterval scanTime = 4;

// 重连设备定时器时间间隔
static NSTimeInterval reConnectTimerInterval = 3.0;

#pragma mark - 各种枚举
// 性别
typedef NS_ENUM (NSUInteger, UserGenderType) {
    UserGenderType_Male   = 0x00,
    UserGenderType_Female = 0x01,
    UserGenderType_unknow = 0x02,// 性别未知
};

// 体重单位
typedef NS_ENUM (NSUInteger, UserWeightUnit) {
    UserWeightUnit_KG    = 1,
    UserWeightUnit_Pound = 2,
};

// 身高单位
typedef NS_ENUM (NSUInteger, UserHeightUnit) {
    UserHeightUnit_CM   = 1,
    UserHeightUnit_Inch = 2,
};

// 寻找(震动)我的手环开关状态
typedef NS_ENUM (NSUInteger, FindMyDeviceState) {
    FindMyDeviceState_off = 0x00,
    FindMyDeviceState_on  = 0x01,
};

// 防丢功能的开关状态
typedef NS_ENUM (NSUInteger, AntiLostState) {
    AntiLostState_off = 0x00,
    AntiLostState_on  = 0x01,
};

// 闹钟的开关状态
typedef NS_ENUM(NSUInteger,AlarmState){
    AlarmState_off = 0x00,
    AlarmState_on  = 0x01,
};

// 闹钟重复的开关状态
typedef NS_ENUM(NSUInteger,AlarmRepeatState){
    AlarmRepeatState_off  = 0x00,
    AlarmRepeatState_on   = 0x01,
};


// 来电短信邮件提醒开关状态
typedef NS_ENUM(NSUInteger, SwitchNotification){
    SwitchNotification_off = 0x00,
    SwitchNotification_on  = 0x01,
};

// 来电提醒开关状态
typedef NS_ENUM(NSUInteger, IncomingCallState){
    IncomingCallState_off = 0x00,
    IncomingCallState_on  = 0x01,
};

typedef NS_ENUM(NSUInteger, OtherState){
    OtherState_off = 0x00,
    OtherState_on  = 0x01,
};

// 历史数据同步结果
typedef NS_ENUM (NSUInteger, SyncDataResult) {
    SyncDataResult_fail    = 0x00,
    SyncDataResult_succeed = 0x01,
};

// SET页面
typedef NS_ENUM (NSUInteger, SetType) {
    SetType_Alarm,
//    SetType_Gestures,
    SetType_Notifications,
    SetType_Settings,
    SetType_FindMyWristband,
    SetType_DeleteUserAccount,
};

// 电池状态
typedef NS_ENUM (NSUInteger, BatteryState) {
    BatteryState_NotCharge,
    BatteryState_Charging,
    BatteryState_Full,
};

// 星期
typedef NS_ENUM(NSUInteger, SPKWeekdayType) {
    SPKWeekdayType_SUN = 0,
    SPKWeekdayType_MON,
    SPKWeekdayType_TUE,
    SPKWeekdayType_WED,
    SPKWeekdayType_THU,
    SPKWeekdayType_FRI,
    SPKWeekdayType_SAT,
    SPKWeekdayType_EVERYDAY = 0x7F,
    SPKWeekdayType_WEEKDAYS = 0x3E,
};

// 睡眠SPKSleep对象睡眠状态
typedef NS_ENUM (NSUInteger, SleepType) {
    SleepType_notWear = 1,  //没佩戴;
    SleepType_active,       //活动;
    SleepType_lightSleep,   //浅睡;
    SleepType_deepSleep,    //深睡;
};

// 时间类型(day、week、month)
typedef NS_ENUM (NSUInteger, TimeType) {
    TimeType_Day,
    TimeType_Week,
    TimeType_Month,
};

// 低电量提醒开关状态
typedef NS_ENUM(NSUInteger, LowBatteryState){
    LowBatteryState_off = 0x00,
    LowBatteryState_on  = 0x01,
};

// 设置页面的cell Identifier
static NSString *setCellIdentifier = @"setCell";

#pragma mark - 通告
#pragma mark 登录相关
// 登录成功
static NSString *kNotificationLoginSussed = @"com.spk.OneTouchMove.LoginSussed";

// 硬件计步数据有更新
static NSString *kNotificationStepDataDidUpdate = @"com.spk.OneTouchMove.StepDataDidUpdate";

#pragma mark 硬件相关
// 连接成功的通知
static NSString *kNotificationConnectSucceed = @"com.spk.OneTouchMove.ConnectSucceed";

// 使用者手动断开链接的通知
static NSString *kNotificationDidDisconnectForUser = @"com.spk.OneTouchMove.DidDisconnectForUser";

// 意外断开链接的通知
static NSString *kNotificationDidDisconnectForError = @"com.spk.OneTouchMove.DidDisconnectForError";

// 历史数据同步成功的通知
static NSString *kNotificationSyncHistoryDataCompleted = @"com.spk.OneTouchMove.SyncHistoryDataCompleted";

// 电池状态变化的通知
static NSString *kNotificationBatteryStateDidChanged = @"com.spk.OneTouchMove.BatteryStateDidChanged";

// 当连接硬件后同步历史数据刷新step页面通知
static NSString *kNotificationStepVCUpdate = @"com.spk.OneTouchMove.StepVCUpdate";

// 当设置好个人信息后刷新个人简介页面通知
static NSString *kNotificationProfileVCUdate = @"com.spk.OneTouchMove.ProfileVCUdate";

// 目标值更改后发出的通知
static NSString *kNotificationGoalValueUdate = @"com.spk.OneTouchMove.GoalValueUdate";

// reset手环(发送reset指令)后发出的通知
static NSString *kNotificationDidResetDevice = @"com.spk.OneTouchMove.DidResetDevice";

// 收到硬件信息后发出的通知
static NSString *kNotificationReceivedDeviceInfo = @"com.spk.OneTouchMove.ReceivedDeviceInfo";

// 收到硬件闹钟后发出的通知
static NSString *kNotificationReceivedAlarm = @"com.spk.OneTouchMove.ReceivedAlarm";

// 收到硬件低电量开关状态后发出的通知
static NSString *kNotificationReceivedLowBatteryState = @"com.spk.OneTouchMove.ReceivedLowBatteryState";

// 从服务器下载数据完成后发出的通知
static NSString *kNotificationDownloadServerHistoryDataComplete = @"com.spk.OneTouchMove.DownloadServerHistoryDataComplete";