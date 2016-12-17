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

// UIColor、UIImage可以直接保存。选择transformable类型，直接会帮你自动转换成NSData的
@property (nullable, nonatomic, retain) UIColor *color;
@property (nullable, nonatomic, retain) UIImage *icon;

// 貌似只能声明成NSValue类型，读取、赋值时再进行转换
@property (nullable, nonatomic, retain) NSValue *imgeRect;

// 方法一：使用UserWeightUnit类型属性userWeightUnit进行赋值、取用。但是保存的话就用NSNumber类型属性userWeightUnitTemp
// 要重写userWeightUnit的get、set方法
// 这种方法，模型文件需要创建2个属性(一个用于保存，一个用于使用:赋值、取用)
// 方法二：使用NSNumber类型属性userWeightUnitTemp进行赋值、取用。保存也用它。
// 但是赋值时要将enum转为NSNumber; 取用(如:用于比较)要将NSNumber转为int类型，或者将enum转为NSNumber类型
// 这种方法，模型文件可以只创建1个属性
@property (nonatomic) UserWeightUnit userWeightUnit;
@property (nullable, nonatomic, retain) NSNumber *userWeightUnitTemp;

@end

NS_ASSUME_NONNULL_END
