//
//  BookNowViewController.m
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/29/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import "BookNowViewController.h"
#import "UIViewController+Utility.h"
#import "SWRevealViewController.h"
#import "ValidationUtil.h"
@implementation BookNowViewController


-(void)viewDidLoad
{
    self.checkintxt.text= self.jsona.checkindate;
    self.checkouttxt.text = self.jsona.checkoutdate;
    self.steppervalue.text=@"1";
    self.price.text=self.jsonb.price;
    [self viewDidAppear:YES];
}


-(void)viewDidAppear:(BOOL)animated
{
    [self.cardholdernametxt becomeFirstResponder];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.cardholdernametxt resignFirstResponder];
    [self.cardnumbertxt resignFirstResponder];
    [self.ccvtxt resignFirstResponder];

    return NO;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.cardholdernametxt resignFirstResponder];
    [self.cardnumbertxt resignFirstResponder];
    [self.ccvtxt resignFirstResponder];
    
}




- (IBAction)checkoutBtn:(id)sender {
    NSURL *url = nil;
    NSData *response;
    NSError *theError;
    NSURLResponse *theResponse;
    NSMutableDictionary *dict;
     ValidationUtil *valid = [[ValidationUtil alloc]init];
    NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:@"UserLoginIdSession"];
    if([valid isNumeric:self.cardnumbertxt.text]||[valid isNumeric:self.ccvtxt.text]||[valid isAlphabeticOnly:self.cardholdernametxt.text]||[self.cardholdernametxt.text isEqualToString:@""]||[self.cardnumbertxt.text isEqualToString:@""]||[self.ccvtxt.text isEqualToString:@""]){
    NSString *post = [NSString stringWithFormat:@"hotelid=%@&roomtype=Deluxe&noofrooms=%@&customerid=%@&totalprice=%@&cardnumber=%@&cardholder=%@&cardtype=Credit&ccv=%@&expirydate=January/2019&checkindate=%@&checkoutdate=%@",self.jsonb.hotelid,self.steppervalue.text,str,self.price.text,self.cardnumbertxt.text,self.cardholdernametxt.text,self.ccvtxt.text,self.checkintxt.text,self.checkouttxt.text];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    
    url = [NSURL URLWithString:@"http://localhost:8094/confirmbooking?"];
    
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
    UIAlertController *alert = [self createAlert:@"Success" withMessage:@"Your booking was successful"];
    [self presentViewController:alert animated:YES completion:nil];
    SWRevealViewController *revealVC = [self.storyboard instantiateViewControllerWithIdentifier:@"swRevealViewContoller"];
    revealVC.delegate=self;
    [[UIApplication sharedApplication]keyWindow].rootViewController = revealVC;
    }
    else
    {
        UIAlertController *alert = [self createAlert:@"Error" withMessage:@"Enter Valid credentials"];
        [self presentViewController:alert animated:YES completion:nil];

    }
    
}
- (IBAction)onStep:(UIStepper*)sender {
    double value = [sender value];
    [self.steppervalue setText:[NSString stringWithFormat:@"%d",(int)value]];
    double price = [self.jsonb.price doubleValue];
    double tprice = value*price;
    [self.price setText:[NSString stringWithFormat:@"%f",tprice]];
   
}
@end
