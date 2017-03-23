//
//  SPKDetailViewController.m
//  MoveBandCoreData
//
//  Created by SPK_Antony on 22/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKDetailViewController.h"
#import "SPKUser+CoreDataClass.h"

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
    _weightTextField.text = [NSString stringWithFormat:@"%@", @(_selectedUser.userWeight)];
    if (_selectedUser.userGender == UserGenderType_Male) {
        _heightTextField.text = @"Man";
    }
    else if (_selectedUser.userGender == UserGenderType_Female) {
        _heightTextField.text = @"Woman";
    }
    else {
        _heightTextField.text = @"Unknow";
    }
    _emailTextField.text  = _selectedUser.userEmailAccount;
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
