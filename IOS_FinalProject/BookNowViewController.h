//
//  BookNowViewController.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/29/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonA.h"
#import "JsonB.h"
@interface BookNowViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *checkintxt;
@property (strong, nonatomic) IBOutlet UITextField *checkouttxt;
@property (strong, nonatomic) IBOutlet UIStepper *noofrooms;
@property (strong, nonatomic) IBOutlet UITextField *cardholdernametxt;
@property (strong, nonatomic) IBOutlet UITextField *cardnumbertxt;
@property (strong, nonatomic) IBOutlet UITextField *ccvtxt;
@property (strong, nonatomic) IBOutlet UIButton *checkoutbtn;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *steppervalue;
- (IBAction)onStep:(UIStepper*)sender;

@property(strong,nonatomic) JsonA *jsona;
@property(strong,nonatomic) JsonB *jsonb;
- (IBAction)checkoutBtn:(id)sender;
@end
