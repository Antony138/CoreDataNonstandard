//
//  SPKUser+CoreDataProperties.h
//  CoreDataPractice
//
//  Created by SPK_Antony on 13/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//

#import "SPKUser+CoreDataClass.h"
@import UIKit;
#import "SPKPublic.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPKUser (CoreDataProperties)

+ (NSFetchRequest<SPKUser *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSArray *achievements;
@property (nullable, nonatomic, retain) NSMutableArray *allHistoryDataPackets;
// UIColor直接可以保存？YES，选择transformable类型，直接会帮你自动转换成NSData的
@property (nullable, nonatomic, retain) UIColor *color;
@property (nullable, nonatomic, retain) UIImage *icon;
// 貌似只能声明成NSValue类型，读取、赋值时再进行转换
@property (nullable, nonatomic, retain) NSValue *imgeRect;

@property (nullable, nonatomic, retain) NSObject *userWeightUnit;

@end

NS_ASSUME_NONNULL_END
