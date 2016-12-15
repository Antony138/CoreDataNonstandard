//
//  SPKAchivementTransformer.m
//  CoreDataPractice
//
//  Created by SPK_Antony on 15/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//

#import "SPKAchivementTransformer.h"

@implementation SPKAchivementTransformer

// 输出(ouput)对象的类型？
+ (Class)transformedValueClass {
    return [NSData class];
}

// 将传入的NSArray对象, 转换为NSData对象
- (id)transformedValue:(id)value {
    
    // 《iOS编程》书中的写法
    if (value == nil) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSData class]]) {
        return value;
    }
    return [NSKeyedArchiver archivedDataWithRootObject:value];
    
    // 网上的直接转换写法
    // return [NSKeyedArchiver archivedDataWithRootObject:value];
}

// 将传入的NSData对象, 转换为NSArray对象
- (id)reverseTransformedValue:(id)value {
    return [NSKeyedUnarchiver unarchiveObjectWithData:value];
}

@end
