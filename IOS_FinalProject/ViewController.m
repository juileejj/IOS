//
//  ViewController.m
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/27/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "ParseJSON.h"
#import "JsonA.h"
#import "JsonB.h"
#import "HotelViewController.h"
#import <MapKit/MapKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setMinimumDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    [self.checkintxt setInputView:datePicker];
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    [datePicker2 setMinimumDate:[NSDate date]];
    datePicker2.datePickerMode = UIDatePickerModeDate;
    [datePicker2 addTarget:self action:@selector(updateTextField2:) forControlEvents:UIControlEventValueChanged];
    [self.checkouttxt setInputView:datePicker2];
   // [self.checkouttxt setInputView:datePicker];
    _barButton.target =self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self viewDidAppear:YES];
    [self getLocationFromAddressString:@"boston"];
    
}
-(void)updateTextField:(id)sender
{
   
    UIDatePicker *picker1 = (UIDatePicker*)self.checkintxt.inputView;
    picker1.datePickerMode =UIDatePickerModeDate;
    NSDate *date = picker1.date;
    NSDateFormatter *dateformat = [[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"yyyy-MM-dd"];
    NSString *thedate = [dateformat stringFromDate:date];
    self.checkintxt.text = thedate;
    
}
-(void)updateTextField2:(id)sender
{
    
    UIDatePicker *picker1 = (UIDatePicker*)self.checkouttxt.inputView;
    picker1.datePickerMode =UIDatePickerModeDate;
    NSDate *date = picker1.date;
    NSDateFormatter *dateformat = [[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"yyyy-MM-dd"];
    NSString *thedate = [dateformat stringFromDate:date];
    self.checkouttxt.text = thedate;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.citytxt becomeFirstResponder];
  
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.citytxt resignFirstResponder];
    
    return NO;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.citytxt resignFirstResponder];
    [self.adulttxt resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"displayhotels"]) {
        HotelViewController *hotelVC = (HotelViewController* ) segue.destinationViewController;
        hotelVC.hotelArray = self.hotelarray; // it is a good practice to initiate the property first
        hotelVC.jsona = self.jsona;
        // or
        // secondVC.arrayToPass = [self.originalArray mutableCopy];
    }
}

-(CLLocationCoordinate2D) getLocationFromAddressString: (NSString*) addressStr {
    double latitude = 0, longitude = 0;
    NSString *esc_addr =  [addressStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\" :" intoString:nil] && [scanner scanString:@"\"lat\" :" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"\"lng\" :" intoString:nil] && [scanner scanString:@"\"lng\" :" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
    }
    CLLocationCoordinate2D center;
    center.latitude=latitude;
    center.longitude = longitude;
    NSLog(@"View Controller get Location Logitute : %f",center.latitude);
    NSLog(@"View Controller get Location Latitute : %f",center.longitude);
    return center;
    
}
- (IBAction)OnSearchClick:(id)sender {
    
    
    CLLocationCoordinate2D center = [self getLocationFromAddressString:self.citytxt.text];
    NSDictionary *tweet;
    NSArray *publicTimeline;
    NSData *response;
    NSURLResponse *theResponse;
    NSError *theError;
    NSURL *url = nil;
    
    NSString *urlstr =[NSString stringWithFormat:@"http://terminal2.expedia.com:80/x/hotels?maxhotels=100&location=%f,%f&radius=100km&checkInDate=%@&checkOutDate=%@&adults=%@&apikey=zR1tAnWmhd7JriaAFAVRBpseHIFxyE9W",center.latitude,center.longitude,self.checkintxt.text,self.checkouttxt.text,self.adulttxt.text];
    
       url = [NSURL URLWithString:urlstr];
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:url];
    
    // be nice and turn on the network activity indicator
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    // fire the request
    response = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&theResponse error:&theError];
    
    // turn off the network activity indicator
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    NSError *jsonParsingError = nil;
    
    
    NSMutableDictionary *dict;
    dict = [NSJSONSerialization JSONObjectWithData:response
                                                     options:0 error:&jsonParsingError];

  //  NSLog(@"%@",[dict objectForKey:@"HotelCount"]);
    
    ParseJSON *p = [[ParseJSON alloc ]init];
    
   // publicTimeline = [NSJSONSerialization JSONObjectWithData:response
    //                                                 options:0 error:&jsonParsingError];
    
    JsonA *ja =[p parse:dict];
    self.jsona =ja;
    self.hotelarray= ja.jsonBarray;
    
    
    //NSDictionary *hoteltemp= [jsondict objectForKey:@"HotelInfoList"];
   // NSDictionary *hotelTemp = [dict objectForKey:@"HotelInfoList"];

}
@end
