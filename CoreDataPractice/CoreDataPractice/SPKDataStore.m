//
//  SPKDataStore.m
//  CoreDataPractice
//
//  Created by SPK_Antony on 13/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//

#import "SPKDataStore.h"
#import <CoreData/CoreData.h>

@interface SPKDataStore ()

@end

@implementation SPKDataStore

+ (instancetype)shareStore {
    static id shareStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareStore = [[[self class] alloc] init];
    });
    return shareStore;
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

// 覆盖取方法
// 创建NSPersistentContainer对象
- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"MoveBand"];
            
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

@end
