//
//  SPKManager.m
//  MoveBandCoreData
//
//  Created by SPK_Antony on 21/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKManager.h"
#import "SPKMoveBandStore.h"

@implementation SPKManager

+ (instancetype)shareManager {
    static id shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[[self class] alloc] init];
    });
    return shareManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _store = [[SPKMoveBandStore alloc] init];
    }
    return self;
}

@end
