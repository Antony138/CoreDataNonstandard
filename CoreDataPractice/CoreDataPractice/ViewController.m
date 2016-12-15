//
//  ViewController.m
//  CoreDataPractice
//
//  Created by SPK_Antony on 13/12/2016.
//  Copyright © 2016 Spark Technology Inc. All rights reserved.
//

#import "ViewController.h"
#import "SPKDataStore.h"
#import "SPKUser+CoreDataClass.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *usersCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *achievmentCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataPackCountLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    for (int i = 0; i < 5; i++) {
        [[SPKDataStore shareStore] addUser];
    }
    
    // Get all users
    NSArray *allUsers = [SPKDataStore shareStore].allUsers;
    
    // Display total of all users
    _usersCountLabel.text = [@(allUsers.count) stringValue];
    
    // Get first user
    SPKUser *firstUser = allUsers.firstObject;
    
    // Get total of achievment of first user
    _achievmentCountLabel.text = [@(firstUser.achievements.count) stringValue];
    
    // Get total of dataPack of first user
    _dataPackCountLabel.text   = [@(firstUser.allHistoryDataPackets.count) stringValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
