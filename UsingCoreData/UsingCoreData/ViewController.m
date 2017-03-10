//
//  ViewController.m
//  UsingCoreData
//
//  Created by Antony on 2017/3/10.
//  Copyright © 2017年 Spark Technology Inc. All rights reserved.
//

#import "ViewController.h"
#import "HAStore.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (copy, nonatomic) NSArray *allItems;

@property (strong ,nonatomic) HAStore *store;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _store = [[HAStore alloc] init];
    
    _allItems = _store.allItems;
    if (_allItems != nil) {
        _countLabel.text = [NSString stringWithFormat:@"%@", @(_allItems.count)];
        NSLog(@"_allItems数量：%@", @(_allItems.count));
        
    }
    
    __weak typeof(self) weakSelf = self;
    _store.didFetchDataBlock = ^(NSArray *allItems) {
       weakSelf.countLabel.text = [NSString stringWithFormat:@"%@", @(weakSelf.allItems.count)];
        NSLog(@"_allItems数量：%@", @(weakSelf.allItems.count));
    };
}
- (IBAction)createItem:(UIButton *)sender {
    [_store insertNewItem];
    
    
    if (_allItems != nil) {
        NSLog(@"_allItems数量：%@", @(_store.allItems.count));
        _countLabel.text = [NSString stringWithFormat:@"%@", @(_store.allItems.count)];
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
