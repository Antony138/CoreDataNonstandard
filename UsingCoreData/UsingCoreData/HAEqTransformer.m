//
//  HAEqTransformer.m
//  UsingCoreData
//
//  Created by SPK_Antony on 13/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "HAEqTransformer.h"
#import "HAEq.h"

@implementation HAEqTransformer

+ (Class)transformedValueClass {
    return [NSData class];
}

- (id)transformedValue:(id)value {
    if (!value) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSData class]]) {
        return value;
    }
    
    HAEq *eq = (HAEq *)value;
    // 将对象转换成NSData
//    NSData *dataFromEq = [[NSData alloc]initWithBytes:(__bridge const void *)(eq) length:sizeof(eq)];
    
    NSData *dataFromEq = [NSKeyedArchiver archivedDataWithRootObject:eq];
    
    return dataFromEq;
}

- (id)reverseTransformedValue:(id)value {
    NSData *data = (NSData *)value;
//    HAEq *eq = [[HAEq alloc] init];

    HAEq *eq = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
//    [data getBytes:(__bridge void *)(eq) length:sizeof(eq)];
    return eq;
}

@end
