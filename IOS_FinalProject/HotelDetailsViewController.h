//
//  HotelDetailsViewController.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/29/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "JsonB.h"
#import "JsonA.h"
@interface HotelDetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *hotelimage;
@property (strong, nonatomic) IBOutlet UILabel *hotelname;
@property (strong, nonatomic) IBOutlet UILabel *rating;
@property (strong, nonatomic) IBOutlet UILabel *hoteldesc;
@property (strong, nonatomic) IBOutlet UILabel *hotelAddr;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong,nonatomic) JsonB *jsonb;
@property (strong, nonatomic) IBOutlet UIButton *bookBtn;
@property (strong, nonatomic) IBOutlet UILabel *hiddenhotelid;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property(strong,nonatomic) JsonA *jsona;
- (IBAction)OnBookBtnClick:(id)sender;
@end
