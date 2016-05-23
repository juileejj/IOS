//
//  ViewController.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/27/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParseJSON.h"
@interface ViewController : UIViewController
@property(weak,atomic) IBOutlet UIBarButtonItem *barButton;
@property(weak,atomic) IBOutlet UITextField *citytxt;
@property(weak,nonatomic) IBOutlet UITextField *checkintxt;
@property(weak,nonatomic) IBOutlet UITextField *checkouttxt;
@property(weak,atomic) IBOutlet UITextField *adulttxt;

@property(weak,atomic) IBOutlet UIButton *searchbtn;
- (IBAction)OnSearchClick:(id)sender;

@property(strong,atomic) ParseJSON *parsejson;
@property(strong,atomic) JsonA *jsona;
@property(strong,atomic) NSMutableArray *hotelarray;
@end

