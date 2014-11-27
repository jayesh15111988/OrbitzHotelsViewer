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
    
    OrbitzHotelsListViewController* hotelsListViewController = (OrbitzHotelsListViewController*) self.viewControllers[0];
    OrbitzHotelsMapViewController* hotelsMapViewController = (OrbitzHotelsMapViewController*) self.viewControllers[1];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"hotels" ofType:@"json"];
    NSError *deserializingError;
    NSData *content = [[NSData alloc] initWithContentsOfFile:filePath];
    NSArray* hotelsList = [NSJSONSerialization JSONObjectWithData:content
                                                          options:NSJSONReadingAllowFragments
                                                            error:&deserializingError][@"hotels"];
     hotelsListViewController.hotelsObjectsList = [self getArrayObjectsWithJSONarray:hotelsList];
     hotelsMapViewController.hotelsObjectsList = hotelsListViewController.hotelsObjectsList;
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



@end
