//
//  SPKMoveBandStore.m
//  MoveBandCoreData
//
//  Created by SPK_Antony on 21/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKMoveBandStore.h"
#import "SPKUser+CoreDataClass.h"
#import "SPKPublic.h"

@interface SPKMoveBandStore ()

@end


@implementation SPKMoveBandStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Create Core Data Stack
        [self initializeCoreData];
    }
    return self;
}

- (void)initializeCoreData {
    // Get managed object model
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"MoveBand" withExtension:@"momd"];
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSAssert(mom != nil, @"Error initalizing Managed Object Model");
    
    // Create persistent store coordinator
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];

    // Creat managed object context
    _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    // assgin persistent store coordinator
    _context.persistentStoreCoordinator = psc;
    
    // Create .sqlite file
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"DataModel.sqlite"];
    
    // Create persistent store
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error = nil;
        NSPersistentStoreCoordinator *psc = _context.persistentStoreCoordinator;
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
        NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
    });
}

- (void)addNewUser {
    SPKUser *newUser = [NSEntityDescription insertNewObjectForEntityForName:kUserEntityName inManagedObjectContext:_context];
    
    newUser.userName = @"Eason";
    newUser.userID = 9009;
    newUser.isFirstLogin = YES;
    newUser.isWholeProfile = NO;
    
//    [self save];
}

- (void)save {
    NSError *error = nil;
    if ([_context save:&error] == NO) {
        NSAssert(NO, @"Error saving context %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

@end
