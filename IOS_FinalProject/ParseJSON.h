//
//  ParseJSON.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/28/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonA.h"
#import "JsonB.h"
@interface ParseJSON : NSObject

@property(strong,atomic) JsonA *jsonA;
@property(strong,atomic) JsonB *jsonB;

-(JsonA*)parse:(NSMutableDictionary*)jsondict;


@end
