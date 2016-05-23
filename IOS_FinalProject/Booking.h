//
//  Booking.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/27/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Customer.h"
#import "Payment.h"
#import "Room.h"

@interface Booking : NSObject
@property NSInteger *bookingId;
@property(strong,atomic) Payment *payment;
@property(strong,atomic) Room *room;
@property(strong,atomic) Customer *customer;
@end
