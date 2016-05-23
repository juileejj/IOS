//
//  ValidationUtil.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/29/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ValidationUtil : NSObject<UIAlertViewDelegate>
-(BOOL)isAlphabeticOnly:(NSString *)input;
-(BOOL)isValidEmail:(NSString *)input;
-(BOOL)isNumeric:(NSString *)input;
-(void)showInputErrorAlert;
@end
