//
//  HAEq.m
//  UsingCoreData
//
//  Created by SPK_Antony on 13/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "HAEq.h"

@implementation HAEq

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.kHz16 = 0.1;
        self.kHz8  = 0.2;
        self.kHz4  = 0.3;
        self.kHz2  = 0.4;
        self.kHz1  = 0.5;
        self.Hz500 = 0.6;
        self.Hz250 = 0.7;
        self.Hz125 = 0.8;
        self.Hz64  = 0.9;
        self.Hz32  = 1.0;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _kHz16          = [aDecoder decodeFloatForKey:@"kHz16"];
        _kHz8                 = [aDecoder decodeFloatForKey:@"kHz8"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeFloat:_kHz16 forKey:@"kHz16"];
    [aCoder encodeFloat:_kHz8 forKey:@"kHz8"];

}

@end
