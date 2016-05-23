//
//  LoginViewController.m
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/29/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import "LoginViewController.h"
#import "NSString+MD5.h"
#import "ValidationUtil.h"
#import "UIViewController+Utility.h"
#import "SWRevealViewController.h"
#import "ViewController.h"
@implementation LoginViewController

-(void)viewDidAppear:(BOOL)animated
{
    [self.emailtxt becomeFirstResponder];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.emailtxt resignFirstResponder];
    [self.passwordtxt resignFirstResponder];
    return NO;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
  
    [self.emailtxt resignFirstResponder];
    [self.passwordtxt resignFirstResponder];
    
}
- (IBAction)onLoginBtnClick:(id)sender {
    NSURL *url = nil;
    NSData *response;
    NSError *theError;
    NSURLResponse *theResponse;
    NSMutableDictionary *dict;
    ValidationUtil *valid = [[ValidationUtil alloc]init];
    if([self.emailtxt.text isEqualToString:@""]||[self.passwordtxt.text isEqualToString:@""]||[valid isValidEmail:self.emailtxt.text]){
        
        NSString *md5 = [self.passwordtxt.text MD5String];
        NSString *post = [NSString stringWithFormat:@"emailId=%@&password=%@",self.emailtxt.text,md5];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
        
        url = [NSURL URLWithString:@"http://localhost:8094/login?"];
        
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
        NSString *personid = [dict objectForKey:@"personId"];
        
          [[NSUserDefaults standardUserDefaults] setObject:personid forKey:@"UserPersonId"];
        [[NSUserDefaults standardUserDefaults] setObject:self.emailtxt.text  forKey:@"UserLoginIdSession"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:@"UserLoginIdSession"];
        
        if(str==nil||[str isEqualToString:@""])
        {
            UIAlertController *alert = [self createAlert:@"Error" withMessage:@"Please enter valid credentials"];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else
            { SWRevealViewController *revealVC = [self.storyboard instantiateViewControllerWithIdentifier:@"swRevealViewContoller"];
    revealVC.delegate=self;
    [[UIApplication sharedApplication]keyWindow].rootViewController = revealVC;


        }
    }
    else
    {
        UIAlertController *alert = [self createAlert:@"Error" withMessage:@"Please enter valid credentials"];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
   
    
}
@end
