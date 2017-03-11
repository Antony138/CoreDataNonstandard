//
//  HAStore.m
//  UsingCoreData
//
//  Created by Antony on 2017/3/10.
//  Copyright © 2017年 Spark Technology Inc. All rights reserved.
//

#import "HAStore.h"
#import "HAEmployee.h"
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

- (NSArray *)allItems {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    
    NSError *error = nil;
    
    NSArray *results = [_context executeFetchRequest:request error:&error];
    
    // Use NSManagedObject
    HAEmployee *firstEmployee = results.firstObject;
    
    NSLog(@"firstEmployeeName:%@", firstEmployee.name);
    NSLog(@"age: %@", @(firstEmployee.age));
    NSLog(@"isFreshman: %@", @(firstEmployee.isFreshman));
    NSLog(@"startDate: %@", firstEmployee.startDate);
    
    // Do not use NSManagedObject subcalss
    /*
    NSManagedObject *firstEmployee = results.firstObject;
    
    // Log managed object values
    NSLog(@"firstEmployeeName:%@", [firstEmployee valueForKeyPath:@"name"]);
    NSLog(@"age: %@", [firstEmployee valueForKeyPath:@"age"]);
    NSLog(@"isFreshman: %@", [firstEmployee valueForKeyPath:@"isFreshman"]);
    NSLog(@"startDate: %@", [firstEmployee valueForKeyPath:@"startDate"]);
     */
    
    if (!results) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
    if (_didFetchDataBlock) {
        _didFetchDataBlock(results);
    }
    NSLog(@"从沙盒拿回了数据，数据量是%@", @(results.count));
    
    return results;
}

- (void)insertNewItem {
    
    // Do not use NSManagedObject subclass
    /*
    // insert managed object
    NSManagedObject *employee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:_context];
    
    // assign managed object
    [employee setValue:@"Antony" forKeyPath:@"name"];
    [employee setValue:@(31) forKeyPath:@"age"];
    [employee setValue:@(1) forKeyPath:@"isFreshman"];
    [employee setValue:[NSDate date] forKeyPath:@"startDate"];
    */
    
    // Use NSManagedObject subclass
    // insert managed object
    HAEmployee *employee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:_context];
    
    // assign managed object
    employee.name = @"Anotny";
    employee.age = 18;
    employee.isFreshman = NO;
    employee.startDate = [NSDate date];
     
    [self save];
}

- (void)save {
    NSError *error = nil;
    if ([_context save:&error] == NO) {
        NSAssert(NO, @"Error saving context %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

- (void)removeItem {
//    [_context deleteObject:<#(nonnull NSManagedObject *)#>]
}

@end
