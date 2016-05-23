//
//  YourBookingViewController.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/29/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YourBookingViewController : UITableViewController

@property (strong,atomic) NSMutableArray *bookinghotelarray;

@property (strong,atomic) NSMutableDictionary *bookingdict;
-(IBAction)didTapEditButton:(id)sender;
@end
