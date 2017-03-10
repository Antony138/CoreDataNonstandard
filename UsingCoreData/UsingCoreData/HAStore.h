//
//  HAStore.h
//  UsingCoreData
//
//  Created by Antony on 2017/3/10.
//  Copyright © 2017年 Spark Technology Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DidFetchDataBlock)(NSArray *allItem);

@interface HAStore : NSObject

@property (copy, nonatomic) NSArray *allItems;

@property (copy, nonatomic)DidFetchDataBlock didFetchDataBlock;

- (void)insertNewItem;

- (void)removeItem;

- (void)save;

@end
