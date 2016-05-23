//
//  HotelViewController.h
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/28/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonA.h"
@interface HotelViewController : UITableViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>


{
    IBOutlet UITableView *patientTable;
    IBOutlet UISearchBar *patientSearchBar;
    NSMutableArray *filteredString;
    BOOL isFiltered ;

}
@property NSMutableArray *hotelArray;
@property NSMutableArray *hotelNames;
@property JsonA *jsona;
@end
