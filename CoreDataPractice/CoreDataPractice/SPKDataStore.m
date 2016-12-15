//
//  SPKDataStore.m
//  CoreDataPractice
//
//  Created by SPK_Antony on 13/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//

#import "SPKDataStore.h"
@import CoreData;
@import UIKit;
#import "SPKUser+CoreDataClass.h"

// 查明系统是否小于某个版本
#define VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

static NSString *kEntityName = @"SPKUser";
static NSString *kModelName  = @"MoveBand";
static NSString *kiOS10      = @"10.0";

@interface SPKDataStore ()

// For iOS10(iOS10新出现的类)
@property (readonly, strong) NSPersistentContainer *persistentContainer;

// For less than iOS10
@property (nonatomic, strong) NSManagedObjectContext *context;

@property (nonatomic, strong) NSManagedObjectModel *model;


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

- (instancetype)init {
    self = [super init];
    if (self) {
        
        if ( VERSION_LESS_THAN(@"10.0") ) {
            // 非iOS10的系统，不能用NSPersistentContainer类去创建CoreData stack
            
            _model = [NSManagedObjectModel mergedModelFromBundles:nil];
            
            NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
            
            NSString *path = [self dataArchivePath];
            NSURL *storeURL = [NSURL fileURLWithPath:path];
            
            NSError *error = nil;
            
            if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
                @throw [NSException exceptionWithName:@"OpenFailure" reason:[error localizedDescription] userInfo:nil];
            }
            
            _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
            _context.persistentStoreCoordinator = psc;
        }
        
        [self loadAllUsers];
    }
    return self;
}

#pragma mark - Core Data stack

// iOS10的方法
@synthesize persistentContainer = _persistentContainer;

// 覆盖取方法
// 创建NSPersistentContainer对象
- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:kModelName];
            
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

// 非iOS10的方法
// 自定义数据保存路径
- (NSString *)dataArchivePath
{
    // Make sure that the first argument is NSDocumentDirectory
    // and not NSDocumentationDirectory
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // Get the one document directory from that list
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:@"spkusers.data"];
}

# pragma mark -

- (NSArray *)allUsers {
    return [self loadAllUsers];
}

- (NSArray *)loadAllUsers {
    // 创建request对象(作用:告诉CoreData,你要获取什么数据)
    NSFetchRequest *loadAllUsersRequest = [[NSFetchRequest alloc] init];
    
    // NSEntityDescription，就表示SPKUser这个entity？
    // iOS10与否，传入不同的context对象
    NSEntityDescription *entity = [NSEntityDescription entityForName:kEntityName
                                              inManagedObjectContext: VERSION_LESS_THAN(@"10.0") ? self.context : self.persistentContainer.viewContext];
    
    // 表示要request的entity是SPKUser？
    loadAllUsersRequest.entity = entity;
    
    NSError *error = nil;
    
    NSArray *users = [_persistentContainer.viewContext executeFetchRequest:loadAllUsersRequest error:&error];
    
    if (error != nil) {
        NSLog(@"Fetch Fail. Unresolved error %@, %@", error, error.userInfo);
        return nil;
    }
    else {
        NSLog(@"Fetch succed! users:%@; users count:%@", users, @(users.count));
        return users;
    }
}

- (void)addUser {
    NSError *error = nil;
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:kEntityName
                                              inManagedObjectContext:VERSION_LESS_THAN(kiOS10) ? self.context : self.persistentContainer.viewContext];
    
    SPKUser *newUser = (SPKUser *)[[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:VERSION_LESS_THAN(kiOS10) ? self.context : self.persistentContainer.viewContext];
    
    // 每个用户5个成就
    newUser.achievements = @[@"achivement1", @"achivement2", @"achivement3", @"achivement4", @"achivement5"];
    
    // 每个用户5包数据
    newUser.allHistoryDataPackets = [NSMutableArray arrayWithObjects:@"pack1", @"pack2", @"pack3", @"pack4", @"pack5", nil];
    
    newUser.color = [UIColor blueColor];
    
    newUser.icon = [UIImage imageNamed:@"scanning"];
    
    BOOL saveSucceed = [VERSION_LESS_THAN(kiOS10) ? self.context : self.persistentContainer.viewContext save:&error];
    
    if (saveSucceed == YES) {
        NSLog(@"新增一个用户，并保存成功");
    }
    else {
        NSLog(@"新增用户失败. Unresolved error %@, %@", error, error.userInfo);
    }
}

@end
