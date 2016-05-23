//
//  LoginViewController.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/29/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *emailtxt;
@property (strong, nonatomic) IBOutlet UITextField *passwordtxt;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)onLoginBtnClick:(id)sender;

@end
