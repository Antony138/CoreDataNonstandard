//
//  SPKDataPackTransformer.m
//  CoreDataPractice
//
//  Created by SPK_Antony on 15/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//

#import "SPKDataPackTransformer.h"

@implementation SPKDataPackTransformer

+ (Class)transformedValueClass {
    return [NSData class];
}

- (id)transformedValue:(id)value {
    if (value == nil) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSData class]]) {
        return value;
    }
    
    return [NSKeyedArchiver archivedDataWithRootObject:value];
}

- (id)reverseTransformedValue:(id)value {
    return [NSKeyedUnarchiver unarchiveObjectWithData:value];
}

@end
