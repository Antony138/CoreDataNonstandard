//
//  SPKDataStore.h
//  CoreDataPractice
//
//  Created by SPK_Antony on 13/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface SPKDataStore : NSObject

// 作为接口属性,给其他类调用,以完成数据的保存
@property (readonly, strong) NSPersistentContainer *persistentContainer;

+ (instancetype)shareStore;

@end
