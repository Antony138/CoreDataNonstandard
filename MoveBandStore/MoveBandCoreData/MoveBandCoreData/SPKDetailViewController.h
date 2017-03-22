//
//  SPKDetailViewController.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 22/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SPKUser;

@interface SPKDetailViewController : UIViewController

@property (strong, nonatomic) SPKUser *selectedUser;

@property (nonatomic, copy) void (^dismissBlock)(void);

@end
