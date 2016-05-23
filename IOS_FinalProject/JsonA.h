//
//  JsonA.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/28/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonA : NSObject
@property NSInteger hotelCount;
@property(strong,atomic) NSString *checkindate;
@property(strong,atomic) NSString *checkoutdate;
@property(strong,atomic) NSMutableArray *jsonBarray;
@end
