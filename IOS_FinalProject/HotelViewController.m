//
//  HotelViewController.m
//  IOS_FinalProject
//
//  Created by Tushar Kale on 4/28/16.
//  Copyright © 2016 TusharKale. All rights reserved.
//

#import "HotelViewController.h"
#import "TabelCell.h"
#import "JsonA.h"
#import "JsonB.h"
#import "HotelDetailsViewController.h"
@implementation HotelViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    patientSearchBar.delegate=self;
    patientTable.delegate=self;
    self.hotelNames = [[NSMutableArray alloc]init];
    for(JsonB *b in self.hotelArray)
    {
        [self.hotelNames addObject:b.hotelname];
    }
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [patientTable resignFirstResponder];
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length==0)
    {
        isFiltered=NO;
    }
    else
    {
        isFiltered=YES;
        filteredString=[[NSMutableArray alloc]init];
        for(NSString *str in self.hotelNames)
        {
            NSRange stringRange =[str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location!=NSNotFound)
            {
                [filteredString addObject:str];
            }
        }
    }
    [patientTable reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(isFiltered)
    {
        return [filteredString count];
    }
    return [self.hotelArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TabelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell)
    {
        cell = [[TabelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    JsonB *jsonobj = [self.hotelArray objectAtIndex:indexPath.row];
    cell.hotelName.text = jsonobj.hotelname;
    cell.hoteldesc.text = jsonobj.desc;
    NSURL *url = [NSURL URLWithString:jsonobj.thumburl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.hotelImage.image= [[UIImage alloc]initWithData:data];
    return cell;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"hotelSegue"])
    {
        
        NSIndexPath *path=[self.tableView indexPathForSelectedRow];
        // UITableViewCell *selectedCell= [self.tableView cellForRowAtIndexPath:path];
        NSInteger row=path.row;
        JsonB *jb = self.hotelArray[row];
        HotelDetailsViewController *hotelVC = (HotelDetailsViewController* ) segue.destinationViewController;
        hotelVC.jsonb = jb;
        hotelVC.jsona = self.jsona;
          }
}
@end
