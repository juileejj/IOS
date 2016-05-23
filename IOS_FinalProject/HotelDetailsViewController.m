//
//  HotelDetailsViewController.m
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/29/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import "HotelDetailsViewController.h"
#import "LoginViewController.h"
#import "BookNowViewController.h"

@implementation HotelDetailsViewController
@synthesize jsonb;
#define METERS_PER_MILE 1609.344
-(void)viewDidLoad
{
    self.hotelname.text = self.jsonb.hotelname;
    _rating.text=self.jsonb.rating;
    _price.text=self.jsonb.price;
    _hoteldesc.text = self.jsonb.desc;
    _hiddenhotelid.text = self.jsonb.hotelid;
    NSString *address = [NSString stringWithFormat:@"%@\n%@\n%@\n%@", self.jsonb.streetAddr, self.jsonb.province,self.jsonb.city,self.jsonb.country];
    self.hotelAddr.text= address;
    NSURL *url = [NSURL URLWithString:self.jsonb.thumburl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    self.hotelimage.image= [[UIImage alloc]initWithData:data];
    
}
-(void)viewWillAppear:(BOOL)animated{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude=39.281516;
    zoomLocation.longitude= -76.580806;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    [_mapView setRegion:viewRegion animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"checkoutSegue"])
    {
        BookNowViewController *book = (BookNowViewController* ) segue.destinationViewController;
        book.jsona = self.jsona;
        book.jsonb= self.jsonb;
    }
}
- (IBAction)OnBookBtnClick:(id)sender {
    
    NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:@"UserLoginIdSession"];
    NSURL *url = nil;
    NSData *response;
    NSError *theError;
    NSURLResponse *theResponse;
    NSMutableDictionary *dict;
    
    
    NSString *post = [NSString stringWithFormat:@"hotelid=%@&hotelname=%@&description=hjj&detailsurl=hjvv&thumbnailurl=bjgk&rating=4.8&streetaddress=hvvhjftufv&city=hvjvfjfhvj&province=jhbgui&country=gfhgjhv&price=%@",self.jsonb.hotelid,self.jsonb.hotelname,self.jsonb.price];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];

    url = [NSURL URLWithString:@"http://localhost:8094/saveHotel?"];
    
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
    dict = [NSJSONSerialization JSONObjectWithData:response
                                           options:0 error:&jsonParsingError];
}
@end
