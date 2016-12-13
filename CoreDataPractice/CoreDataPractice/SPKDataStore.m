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

// iOS10新出现的类
@property (readonly, strong) NSPersistentContainer *persistentContainer;

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

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadAllUsers];
    }
    return self;
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

- (NSArray *)loadAllUsers {
    // 创建request对象(作用:告诉CoreData,你要获取什么数据)
    NSFetchRequest *loadAllUsersRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SPKUser" inManagedObjectContext:_persistentContainer.viewContext];
    
    loadAllUsersRequest.entity = entity;
    
    
    NSError *error = nil;
    
    NSArray *users = [_persistentContainer.viewContext executeFetchRequest:loadAllUsersRequest error:&error];
    
    if (error != nil) {
        NSLog(@"Fetch Fail. Unresolved error %@, %@", error, error.userInfo);
        return nil;
    }
    else {
        return users;
    }
}

@end
