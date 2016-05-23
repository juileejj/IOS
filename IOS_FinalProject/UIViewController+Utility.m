
//
//  UIViewController+Utility.m
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/29/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import "UIViewController+Utility.h"

@implementation UIViewController (Utility)

-(UIAlertController *)createAlert:(NSString *)title withMessage:(NSString *)message {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction
                       actionWithTitle:@"OK"
                       style:UIAlertActionStyleDefault
                       handler:^(UIAlertAction * action)
                       {
                           [alert dismissViewControllerAnimated:YES completion:nil];
                           
                       }];
    [alert addAction:ok];
    return  alert;
}
@end
