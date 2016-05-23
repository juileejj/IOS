//
//  JsonB.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/28/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonB : NSObject


@property(strong,atomic) NSString *hotelid;
@property(strong,atomic) NSString *hotelname;
@property(strong,atomic) NSString *streetAddr;
@property(strong,atomic) NSString *city;
@property(strong,atomic) NSString *province;
@property(strong,atomic) NSString *country;
@property(strong,atomic) NSString *desc;
@property(strong,atomic) NSString *price;
@property(strong,atomic) NSString *detailsurl;
@property(strong,atomic) NSString *thumburl;
@property(strong,atomic) NSString *rating;

@end
