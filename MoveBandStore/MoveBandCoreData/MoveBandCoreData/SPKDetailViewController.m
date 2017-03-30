//
//  SPKDetailViewController.m
//  MoveBandCoreData
//
//  Created by SPK_Antony on 22/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKDetailViewController.h"
#import "SPKUser+CoreDataClass.h"
#import "SPKDay+CoreDataClass.h"

@interface SPKDetailViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@end

@implementation SPKDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameTextField.text   = _selectedUser.userName;
    
    _idTextField.text     = [NSString stringWithFormat:@"%@", @(_selectedUser.userID)];
    
    _weightTextField.text = [NSString stringWithFormat:@"packet个数: %@", @(_selectedUser.allPackets.count)];
    
    if (_selectedUser.userGender == UserGenderType_Male) {
        _heightTextField.text = @"Man";
    }
    else if (_selectedUser.userGender == UserGenderType_Female) {
        _heightTextField.text = @"Woman";
    }
    else {
        _heightTextField.text = @"Unknow";
    }
    
    uint32_t stepCount = 0;
    uint32_t caloriesCount = 0;
    uint32_t timeStamp = 0;
    uint64_t index = 0;
    for (SPKPackets *packet in _selectedUser.allPackets) {
        stepCount += packet.steps;
        caloriesCount += packet.calories;
        timeStamp = packet.startTimeStamp;
        index = packet.index;
        NSLog(@"index: %@; time:%@", @(packet.index), @(timeStamp));
    }
    _emailTextField.text  = [NSString stringWithFormat:@"步数: %@; 卡路里: %@; Time: %@, 最后一包的索引: %@", @(stepCount), @(caloriesCount), @(timeStamp), @(index)];

    /*
    for (SPKMonth *month in _selectedUser.months) {
        NSLog(@"moth %@ 的开始时间戳是: %@, 有: %@天", @([_selectedUser.months indexOfObject:month]), @(month.startTimeStamp), @(month.days.count));

        for (SPKDay *day in month.days) {
            NSInteger dayIndex = [month.days indexOfObject:day];
            NSLog(@"moth %@ 的第 %@ 天, 有 %@ 小时", @([_selectedUser.months indexOfObject:month]), @(dayIndex), @(day.hours.count));
            
            for (SPKHour *hour in day.hours) {
                
                NSLog(@"hour %@的开始时间戳: %@", @([day.hours indexOfObject:hour]), @(hour.startTimeStamp));
            }
        }
    }
    */
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Clear first responder
    [self.view endEditing:YES];
    
    // 为什么要写这部分代码, Core Data才能保存数据？
    // "Save" changes to item
    self.selectedUser.userName         = _nameTextField.text;
    self.selectedUser.userID           = _idTextField.text.intValue;
    self.selectedUser.userWeight       = _weightTextField.text.intValue;
    if ([_heightTextField.text isEqualToString:@"Man"]) {
        self.selectedUser.userGender = UserGenderType_Male;
    }
    else if ([_heightTextField.text isEqualToString:@"Woman"]) {
        self.selectedUser.userGender = UserGenderType_Female;
    }
    else {
        self.selectedUser.userGender = UserGenderType_unknow;
    }
    self.selectedUser.userEmailAccount = _emailTextField.text;
}

- (IBAction)saveAndBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:self.dismissBlock];
}

@end
