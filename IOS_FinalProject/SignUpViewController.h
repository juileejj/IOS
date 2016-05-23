//
//  SignUpViewController.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/28/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *firstNametxt;
@property (strong, nonatomic) IBOutlet UITextField *lastNametxt;
@property (strong, nonatomic) IBOutlet UITextField *emailtxt;
@property (strong, nonatomic) IBOutlet UITextField *passwordtxt;
@property (strong, nonatomic) IBOutlet UIButton *signupbtn;
- (IBAction)OnSignUpClick:(id)sender;

@end
