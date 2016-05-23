//
//  ParseJSON.m
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/28/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import "ParseJSON.h"

@implementation ParseJSON

@synthesize jsonA;
@synthesize jsonB;
-(JsonA*)parse:(NSMutableDictionary*)jsondict
{
    jsonA = [[JsonA alloc]init];
    jsonA.jsonBarray = [[NSMutableArray alloc]init];
   // NSLog(@"%@",[jsondict objectForKey:@"HotelCount"]);
    jsonA.hotelCount = [[jsondict objectForKey:@"HotelCount"]integerValue];
    NSString *temp = [jsondict objectForKey:@"HotelCount"];
    NSLog(@"Value: %zd", [jsonA hotelCount]);
    NSDictionary *stayDates =[jsondict objectForKey:@"StayDates"];
    jsonA.checkindate=[stayDates objectForKey:@"CheckInDate"];
    jsonA.checkoutdate=[stayDates objectForKey:@"CheckOutDate"];
   // NSLog(@"%@ %@ %zd",jsonA.checkindate,jsonA.checkoutdate,jsonA.hotelCount);
    NSDictionary *hoteltemp= [jsondict objectForKey:@"HotelInfoList"];
    NSDictionary *hotels = [hoteltemp objectForKey:@"HotelInfo"];
    for(NSDictionary *hotel in hotels)
    {
        jsonB = [[JsonB alloc]init];
        jsonB.hotelid= [hotel objectForKey:@"HotelID"];
        jsonB.hotelname=[hotel objectForKey:@"Name"];
        NSDictionary *locationTemp = [hotel objectForKey:@"Location"];
        jsonB.streetAddr = [locationTemp objectForKey:@"StreetAddress"];
        jsonB.city = [locationTemp objectForKey:@"City"];
        jsonB.province = [locationTemp objectForKey:@"Province"];
        jsonB.country = [locationTemp objectForKey:@"Country"];
        jsonB.desc=[hotel objectForKey:@"Description"];
        jsonB.rating = [hotel objectForKey:@"StarRating"];
        jsonB.thumburl = [hotel objectForKey:@"ThumbnailUrl"];
        NSDictionary *price1temp= [hotel objectForKey:@"Price"];
        NSDictionary *price2temp = [price1temp objectForKey:@"TotalRate"];
        jsonB.price = [price2temp objectForKey:@"Value"];
        [jsonA.jsonBarray addObject:jsonB];

    }
    
           // NSLog(@"%@",[jsonA.jsonBarray objectAtIndex:0]);
 
   
    return jsonA;
}

@end
