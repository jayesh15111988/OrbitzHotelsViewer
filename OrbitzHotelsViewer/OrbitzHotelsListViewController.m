//
//  OrbitzHotelsListViewController.m
//  OrbitzHotelsViewer
//
//  Created by Jayesh Kawli Backup on 11/27/14.
//  Copyright (c) 2014 Jayesh Kawli Backup. All rights reserved.
//

#import "OrbitzHotelsListViewController.h"
#import "HotelsListCustomCell.h"
#import <SDWebImage/SDWebImageManager.h>
#import <UIImageView+WebCache.h>
#import "OrbitzHotel.h"

@interface OrbitzHotelsListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation OrbitzHotelsListViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    //Add border to hotel
    self.tableView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.tableView.layer.borderWidth = 1.0f;
    [self.tableView reloadData];
}

#pragma tableView datasource and delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.hotelsObjectsList count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HotelsListCustomCell* cell = [tableView dequeueReusableCellWithIdentifier:@"hotelscell" forIndexPath:indexPath];
    OrbitzHotel* currentHotel = self.hotelsObjectsList[indexPath.row];
    cell.hotelName.text = currentHotel.hotelName;
    
    if(currentHotel.hotelImageURL) {
        [cell.hotelImage sd_setImageWithURL:currentHotel.hotelImageURL placeholderImage:[UIImage imageNamed:@"placeholder_image.png"]];
    }
    else {
        //No image was listed for given hotel
        [cell.hotelImage setImage:[UIImage imageNamed:@"placeholder_image.png"]];
    }
    return cell;
}

@end
