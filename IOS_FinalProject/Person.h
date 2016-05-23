//
//  Person.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/27/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property NSInteger personId;
@property(strong,atomic) NSString *firstName;
@property(strong,atomic) NSString *lastName;
@property(strong,atomic) NSString *emailId;
@property(strong,atomic) NSString *password;
@end
