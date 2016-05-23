//
//  Room.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/27/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hotel.h"
@interface Room : NSObject
@property NSInteger *roomId;
@property(strong,atomic) NSString *roomType;
@property(strong,atomic) NSString *bookingStatus;
@property double price;
@property(strong,atomic) NSString *bookedFrom;
@property(strong,atomic) NSString *bookedTo;
@property(strong,atomic) Hotel *hotel;
@end
