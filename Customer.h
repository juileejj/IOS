//
//  Customer.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/27/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import "Person.h"
#import "Card.h"

@interface Customer : Person

@property (strong,atomic) Card *creditCard;
@property (strong,atomic) NSMutableArray *bookingList;

@end
