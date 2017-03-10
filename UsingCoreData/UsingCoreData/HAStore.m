//
//  HAStore.m
//  UsingCoreData
//
//  Created by Antony on 2017/3/10.
//  Copyright © 2017年 Spark Technology Inc. All rights reserved.
//

#import "HAStore.h"
@import CoreData;

@interface HAStore ()

@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation HAStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeCoreData];
    }
    return self;
}

- (void)initializeCoreData {
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Company" withExtension:@"momd"];
    
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    NSAssert(mom != nil, @"Error initalizing Managed Object Model");
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    
    _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    _context.persistentStoreCoordinator = psc;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"DataModel.sqlite"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSError *error = nil;
        
        NSPersistentStoreCoordinator *psc = _context.persistentStoreCoordinator;
        
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
        
        NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
  
    });
}


@end
