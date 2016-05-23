//
//  ValidationUtil.m
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/29/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import "ValidationUtil.h"

@implementation ValidationUtil
-(BOOL)isAlphabeticOnly:(NSString *)input
{
    NSString *alpha = @"[a-zA-Z]+";
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", alpha];
    
    return [regexTest evaluateWithObject:input];
}
-(BOOL)isValidEmail:(NSString *)input
{
NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    return [emailTest evaluateWithObject:input];
}

-(BOOL)isNumeric:(NSString *)input
{
    NSString *emailRegEx = @"[0-9]";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    return [emailTest evaluateWithObject:input];
}


@end
