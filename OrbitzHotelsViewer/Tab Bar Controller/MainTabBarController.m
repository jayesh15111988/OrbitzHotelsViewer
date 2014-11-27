//
//  MainTabBarController.m
//  OrbitzHotelsViewer
//
//  Created by Jayesh Kawli Backup on 11/27/14.
//  Copyright (c) 2014 Jayesh Kawli Backup. All rights reserved.
//

#import "MainTabBarController.h"
#import "OrbitzHotel.h"
#import "OrbitzHotelsListViewController.h"
#import "OrbitzHotelsMapViewController.h"

@implementation MainTabBarController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    //Two view controllers one for listing hotels and other for displaying hotels on the map
    
    OrbitzHotelsListViewController* hotelsListViewController = (OrbitzHotelsListViewController*) self.viewControllers[0];
    OrbitzHotelsMapViewController* hotelsMapViewController = (OrbitzHotelsMapViewController*) self.viewControllers[1];
    
    //Input file hotels.json containing list of all hotels
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"hotels" ofType:@"json"];
    NSError *deserializingError;
    NSData *content = [[NSData alloc] initWithContentsOfFile:filePath];
    NSArray* hotelsList = [NSJSONSerialization JSONObjectWithData:content
                                                          options:NSJSONReadingAllowFragments
                                                            error:&deserializingError][@"hotels"];
    
     hotelsListViewController.hotelsObjectsList = [self getArrayObjectsWithJSONarray:hotelsList];
     hotelsMapViewController.hotelsObjectsList = hotelsListViewController.hotelsObjectsList;

    NSDictionary *titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [UIFont systemFontOfSize:14], NSFontAttributeName, nil];

    //customizing font size on the hotels list
    for(UIViewController *tab in  self.viewControllers) {
        [tab.tabBarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
}


-(NSArray*)getArrayObjectsWithJSONarray:(NSArray*)hotelsJSONFormat {
    
    //An array to hold hotels object
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

@end
