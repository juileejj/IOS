//
//  SignUpViewController.m
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/28/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import "SignUpViewController.h"
#import "NSString+MD5.h"
#import "ValidationUtil.h"
#import "UIViewController+Utility.h"
#import "LoginViewController.h"
@implementation SignUpViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewDidAppear:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.firstNametxt becomeFirstResponder];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.firstNametxt resignFirstResponder];
    [self.lastNametxt resignFirstResponder];
    [self.emailtxt resignFirstResponder];
    [self.passwordtxt resignFirstResponder];
    return NO;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.firstNametxt resignFirstResponder];
    [self.lastNametxt resignFirstResponder];
    [self.emailtxt resignFirstResponder];
    [self.passwordtxt resignFirstResponder];
    
}

- (IBAction)OnSignUpClick:(id)sender {
    NSURL *url = nil;
    NSData *response;
     NSError *theError;
    NSURLResponse *theResponse;
     NSMutableDictionary *dict;
    ValidationUtil *valid = [[ValidationUtil alloc]init];
    
    NSString *md5 = [self.passwordtxt.text MD5String];
    
    if([valid isAlphabeticOnly:self.firstNametxt.text]||[valid isAlphabeticOnly:self.lastNametxt.text]|| [self.firstNametxt.text isEqualToString:@""]||[self.lastNametxt.text isEqualToString:@""]||[self.emailtxt.text isEqualToString:@""]||[self.firstNametxt.text isEqualToString:@""]||[self.passwordtxt.text isEqualToString:@""]||[valid isValidEmail:self.emailtxt.text]){
    NSString *post = [NSString stringWithFormat:@"emailId=%@&firstName=%@&lastName=%@&password=%@",self.emailtxt.text,self.firstNametxt.text,self.lastNametxt.text,md5];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    
    url = [NSURL URLWithString:@"http://localhost:8094/user?"];
    
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
    else
    {
        UIAlertController *alert = [self createAlert:@"Error" withMessage:@"Please enter valid credentials"];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    if(dict==nil)
    {
        UIAlertController *alert = [self createAlert:@"Error" withMessage:@"User with this email id already exists"];
        [self presentViewController:alert animated:YES completion:nil];

    }
    else
    {
        UIAlertController *alert = [self createAlert:@"Success" withMessage:@"Welcome!"];
        [self presentViewController:alert animated:YES completion:nil];
        LoginViewController * vc = [[LoginViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
        
    }

}
@end
