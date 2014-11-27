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
@property (strong, nonatomic) NSArray* hotelsObjectsList;
@end

@implementation OrbitzHotelsListViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"hotels" ofType:@"json"];
    NSError *deserializingError;
    NSData *content = [[NSData alloc] initWithContentsOfFile:filePath];
    NSArray* hotelsList = [NSJSONSerialization JSONObjectWithData:content
                                                options:NSJSONReadingAllowFragments
                                                  error:&deserializingError][@"hotels"];
    
    self.hotelsObjectsList = [self getArrayObjectsWithJSONarray:hotelsList];
    [self.tableView reloadData];
}

-(NSArray*)getArrayObjectsWithJSONarray:(NSArray*)hotelsJSONFormat {
    
    NSMutableArray* listOfHotelObjects = [NSMutableArray new];
    for(NSDictionary* individualHotel in hotelsJSONFormat) {
        OrbitzHotel* newHotelObject = [OrbitzHotel new];
        newHotelObject.distance = [individualHotel[@"distance"] doubleValue];
        newHotelObject.direction = individualHotel[@"direction"];
        newHotelObject.starRating = individualHotel[@"star_rating"];
        newHotelObject.hotelName = individualHotel[@"name"];
        newHotelObject.nightlyRate = [individualHotel[@"nightly_rate"] doubleValue];
        newHotelObject.promotedNightlyRate = [individualHotel[@"promoted_nightly_rate"] doubleValue];
        newHotelObject.totalRate = [individualHotel[@"total_rate"] doubleValue];
        newHotelObject.hotelLatitude = [individualHotel[@"latitude"] doubleValue];
        newHotelObject.hotelLongitude = [individualHotel[@"longitude"] doubleValue];
        newHotelObject.masterIdentifier = [individualHotel[@"master_id"] integerValue];
        
        if(individualHotel[@"thumbnail"]) {
            newHotelObject.hotelImageURL = [NSURL URLWithString:[individualHotel[@"thumbnail"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
         
        }
        
        newHotelObject.streetAddress = individualHotel[@"street_address"];
        newHotelObject.reviewScore = [individualHotel[@"review_score"] doubleValue];
        [listOfHotelObjects addObject:newHotelObject];
    }
    return listOfHotelObjects;
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
        [cell.hotelImage sd_setImageWithURL:currentHotel.hotelImageURL placeholderImage:nil];
    }
    else {
        [cell.hotelImage setImage:nil];
    }
    
    return cell;
}

@end
