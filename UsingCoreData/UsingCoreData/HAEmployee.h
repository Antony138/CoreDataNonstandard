//
//  HAEmployee.h
//  UsingCoreData
//
//  Created by SPK_Antony on 11/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import <CoreData/CoreData.h>
@class HAEq;

// 自定义的NSManagedObject的子类名称,不一定要和实体(Entity)的名称一致
@interface HAEmployee : NSManagedObject

@property (copy, nonatomic) NSString *name;

// 用NSUInteger会报错, 提示和实体的类型不一致(实体选择的是Integer 16).
@property (nonatomic) uint16_t age;

@property (nonatomic) BOOL isFreshman;

@property (copy ,nonatomic) NSDate *startDate;

@property (strong, nonatomic) HAEq *eq;

@end
