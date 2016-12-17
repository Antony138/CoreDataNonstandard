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
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

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
    
    // Get color
    _colorView.backgroundColor = firstUser.color;
    
    // Get UIImage
    _iconImageView.image = firstUser.icon;
    
    // Get CGrect
    CGRect imageRect = [firstUser.imgeRect CGRectValue];
    NSLog(@"origin: %@, %@; size: %@, %@", @(imageRect.origin.x), @(imageRect.origin.y), @(imageRect.size.width), @(imageRect.size.height));
    
    // 用enum类型属性进行比较
    if (firstUser.userWeightUnit == UserWeightUnit_KG) {
        NSLog(@"(enum)使用者选择了KG");
    }
    else {
        NSLog(@"(enum)使用者选择了Pound");
    }
    
    // 用NSNumber类型属性进行比较
    if ([firstUser.userWeightUnitTemp unsignedIntegerValue] == UserWeightUnit_KG) {
        NSLog(@"(NSNumber)使用者选择了KG");
    }
    else {
        NSLog(@"(NSNumber)使用者选择了Pound");
    }
}


@end
