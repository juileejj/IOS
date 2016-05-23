//
//  Hotel.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/27/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"
@interface Hotel : NSObject

@property NSInteger *hotelId;
@property(strong,atomic) NSString *hotelName;
@property(strong,atomic) NSString *desc;
@property(strong,atomic) NSString *detailsurl;
@property(strong,atomic) NSString *thumburl;
@property(strong,atomic) Location *location;
@property(strong,atomic) NSMutableArray *roomList;
@end
