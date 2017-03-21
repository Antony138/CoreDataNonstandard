//
//  SPKManager.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 21/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SPKMoveBandStore;

@interface SPKManager : NSObject

@property (strong, nonatomic) SPKMoveBandStore *store;

#pragma mark -
+ (instancetype)shareManager;

@end
