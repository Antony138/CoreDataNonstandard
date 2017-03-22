//
//  SPKDetailViewController.m
//  MoveBandCoreData
//
//  Created by SPK_Antony on 22/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import "SPKDetailViewController.h"
#import "SPKUser+CoreDataClass.h"

@interface SPKDetailViewController ()
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
    _heightTextField.text = [NSString stringWithFormat:@"%@", @(_selectedUser.userHeight)];
    _emailTextField.text  = _selectedUser.userEmailAccount;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAndBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
