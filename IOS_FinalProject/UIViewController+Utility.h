//
//  UIViewController+Utility.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/29/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Utility)

-(UIAlertController *)createAlert:(NSString *)title withMessage:(NSString *)message;
@end
