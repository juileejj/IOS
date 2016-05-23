//
//  TabelCell.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/28/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabelCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *hotelName;
@property (strong, nonatomic) IBOutlet UILabel *hoteldesc;
@property (strong, nonatomic) IBOutlet UIImageView *hotelImage;

@end
