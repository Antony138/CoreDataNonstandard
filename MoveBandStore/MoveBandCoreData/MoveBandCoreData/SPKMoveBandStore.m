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
#import "SPKPackets+CoreDataClass.h"
#import "SPKDay+CoreDataClass.h"
#import "SPKTool.h"

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
        
        // 用于支持版本迁移的参数
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                                 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
        NSError *error = nil;
        NSPersistentStoreCoordinator *psc = _context.persistentStoreCoordinator;
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType
                                                     configuration:nil
                                                               URL:storeURL
                                                           options:options
                                                             error:&error];
        NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
    });
}

- (SPKUser *)addNewUser {
    SPKUser *newUser = [NSEntityDescription insertNewObjectForEntityForName:kUserEntityName inManagedObjectContext:_context];
    
    // Test
    newUser.allHistoryDataPackets = [NSMutableArray arrayWithObjects:@"123", @"234", @"456", nil];
    
    for (int i = 0; i < 5; i++) {
        [self addPacketFor:newUser withIndex:i startTimeStamp:[[NSDate date] timeIntervalSince1970] endTimeStamp:[[NSDate date] timeIntervalSince1970] + 300 steps:99 +i calories:100 + i distance:101 + i sleep:102 +i duration:103 + i isUploadedServer:NO];
    }
    
    for (int i = 0; i < 2; i++) {
        [self addDayFor:newUser withStartTimeStamp:[SPKTool getTodayStartTimeStamp] + i * kSecondsPerDay endTimeStamp:[SPKTool getTodayEndTimeStamp] + i * kSecondsPerDay steps:999 calories:999 distance:999 duration:999 deepSleepDuration:999 lightSleepDuration:999 awakeDuration:999 isCalculateSleep:NO];
    }
    
//    [self save];
    
    return newUser;
}

- (void)addPacketFor:(SPKUser *)user withIndex:(int64_t)index startTimeStamp:(int32_t)startTimeStamp endTimeStamp:(int32_t)endTimeStamp steps:(int32_t)steps calories:(int32_t)calories distance:(int32_t)distance sleep:(int32_t)sleep duration:(int32_t)duration isUploadedServer:(BOOL)isUploadedServer {
    
    SPKPackets *newPacket = [NSEntityDescription insertNewObjectForEntityForName:kPacketEntityName inManagedObjectContext:_context];
    newPacket.index = index;
    newPacket.startTimeStamp = startTimeStamp;
    newPacket.endTimeStamp = endTimeStamp;
    newPacket.steps = steps;
    newPacket.calories = calories;
    newPacket.distance = distance;
    newPacket.sleep = sleep;
    newPacket.duration = duration;
    newPacket.isUploadedServer = isUploadedServer;
    
    [user addAllPacketsObject:newPacket];
}

- (void)addDayFor:(SPKUser *)user withStartTimeStamp:(int64_t)startTimeStamp endTimeStamp:(int64_t)endTimeStamp steps:(int64_t)steps calories:(int64_t)calories distance:(int64_t)distance duration:(int64_t)duration deepSleepDuration:(int64_t)deepSleepDuration lightSleepDuration:(int64_t)lightSleepDuration awakeDuration:(int64_t)awakeDuration isCalculateSleep:(BOOL)isCalculateSleep {
    
    SPKDay *newDay = [NSEntityDescription insertNewObjectForEntityForName:kDayEntityName inManagedObjectContext:_context];
    
    newDay.startTimeStamp = startTimeStamp;
    newDay.endTimeStamp = endTimeStamp;
    newDay.steps = steps;
    newDay.calories =calories;
    newDay.distance = distance;
    newDay.duration = duration;
    newDay.deepSleepDuration = deepSleepDuration;
    newDay.lightSleepDuration = lightSleepDuration;
    newDay.awakeDuration = awakeDuration;
    newDay.isCalculateSleep = isCalculateSleep;
    
    [self add24HoursFor:newDay];
    
    [user addAllDaysObject:newDay];
}

- (void)add24HoursFor:(SPKDay *)day {
    for (int i = 0; i < 24; i++) {
        SPKHour *hour = [NSEntityDescription insertNewObjectForEntityForName:kHourEntityName inManagedObjectContext:_context];
        
        hour.startTimeStamp = day.startTimeStamp + i * 3600;
        hour.endTimeStamp = hour.startTimeStamp + 3600;
        hour.steps = 999;
        
        [day addHoursObject:hour];
    }
}

- (void)removeUser:(SPKUser *)user {
    [_context deleteObject:user];
}

- (void)save {
    NSError *error = nil;
    if ([_context save:&error] == NO) {
        NSAssert(NO, @"Error saving context %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

@end
