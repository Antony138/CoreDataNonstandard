//
//  SPKMoveBandStore.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 21/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;
@class SPKUser;

@interface SPKMoveBandStore : NSObject

@property (strong, nonatomic) NSManagedObjectContext *context;

- (void)addNewUser;

- (void)removeUser:(SPKUser *)user;

- (void)save;

@end
