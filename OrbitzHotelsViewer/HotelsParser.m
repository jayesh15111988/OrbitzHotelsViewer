//
//  HotelsParser.m
//  OrbitzHotelsViewer
//
//  Created by Jayesh Kawli Backup on 12/5/14.
//  Copyright (c) 2014 Jayesh Kawli Backup. All rights reserved.
//

#import "HotelsParser.h"
#import "OrbitzHotel.h"

@implementation HotelsParser
+(NSArray*)getListOfHotelsObjectsFromFileWithName:(NSString*)localFileName andType:(NSString*)fileType {
    //Input file hotels.json containing list of all hotels
    NSString *filePath = [[NSBundle mainBundle] pathForResource:localFileName ofType:fileType];
    NSError *deserializingError;
    NSData *content = [[NSData alloc] initWithContentsOfFile:filePath];
    NSArray* hotelsList = [NSJSONSerialization JSONObjectWithData:content
                                                          options:NSJSONReadingAllowFragments
                                                            error:&deserializingError][@"hotels"];
    return [self getArrayObjectsWithJSONarray:hotelsList];
}

+(NSArray*)getArrayObjectsWithJSONarray:(NSArray*)hotelsJSONFormat {
    
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
