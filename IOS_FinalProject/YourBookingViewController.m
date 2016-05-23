//
//  YourBookingViewController.m
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/29/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import "YourBookingViewController.h"
#import "TabelCell.h"
@implementation YourBookingViewController

-(void)viewDidLoad
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc] init]];
    self.navigationItem.leftBarButtonItem = nil;
    //self.navigationItem.hidesBackButton = YES;
     NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:@"UserPersonId"];
//    if([str isEqualToString:@""]||str==nil)
//    {
//        
//    }
//    else{
        NSURL *url = nil;
        NSData *response;
        NSError *theError;
        NSURLResponse *theResponse;
        NSMutableArray *dict;
        NSString *post = [NSString stringWithFormat:@"id=%@",str];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
        
        url = [NSURL URLWithString:@"http://localhost:8094/getuserbooking?"];
        
        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        [theRequest setHTTPMethod:@"POST"];
        [theRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [theRequest setHTTPBody:postData];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        
        // fire the request
        response = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&theResponse error:&theError];
        
        // turn off the network activity indicator
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        NSError *jsonParsingError = nil;
        
       self.bookinghotelarray = [NSJSONSerialization JSONObjectWithData:response
                                               options:0 error:&jsonParsingError];
   
 
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return [self.bookinghotelarray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TabelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell)
    {
        cell = [[TabelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
  
        NSDictionary *temp =[self.bookinghotelarray objectAtIndex:indexPath.row];
        if([NSNull null]!=temp){
            if([NSNull null]!=[temp objectForKey:@"bookedFrom"]||[NSNull null]!=[temp objectForKey:@"bookedTo"]||[NSNull null]!=[temp objectForKey:@"hotel"])
            {
                NSString *bookedfrom = [temp objectForKey:@"bookedFrom"];
                NSString *bookedTo = [temp objectForKey:@"bookedTo"];
                NSDictionary *hotelinfo = [temp objectForKey:@"hotel"];
                NSDictionary *hotelname = [hotelinfo objectForKey:@"hotelName"];
               
               
                
                
                    cell.hotelName.text = hotelname;
                    cell.hoteldesc.text = [NSString stringWithFormat:@"%@-%@",bookedfrom,bookedTo];
                
                
            }
        
        
    }
    

    return cell;
}


@end
