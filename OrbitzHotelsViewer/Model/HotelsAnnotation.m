//
//  HotelsAnnotation.m
//  OrbitzHotelsViewer
//
//  Created by Jayesh Kawli Backup on 11/27/14.
//  Copyright (c) 2014 Jayesh Kawli Backup. All rights reserved.
//

#import "HotelsAnnotation.h"

@implementation HotelsAnnotation

- (id)initWithHotelName:(NSString*)name andStreetAddress:(NSString*)streetAddress coordinate:(CLLocationCoordinate2D)coordinate {
    if (self = [super init]) {
        self.hotelName =name;
        self.hotelStreetAddress = streetAddress;
        self.theCoordinate = coordinate;
    }
    return self;
}

- (NSString *)title {
    return self.hotelName;
}

- (NSString *)subtitle {
    return self.hotelStreetAddress;
}

- (CLLocationCoordinate2D)coordinate {
    return self.theCoordinate;
}

- (MKMapItem*)mapItem {
    MKPlacemark *placemark = [[MKPlacemark alloc]
                              initWithCoordinate:self.coordinate
                              addressDictionary:@{@"address":self.hotelStreetAddress}];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = self.hotelName;
    return mapItem;
}

//For debug purpose we will show hotel name and sub title as well
-(NSString*)description {
    return [NSString stringWithFormat:@"%@ %@",self.hotelName,self.subtitle];
}
@end
