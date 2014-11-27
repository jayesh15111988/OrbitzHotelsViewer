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
    if ((self = [super init])) {
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
    return _theCoordinate;
}

- (MKMapItem*)mapItem {
    
    
    MKPlacemark *placemark = [[MKPlacemark alloc]
                              initWithCoordinate:self.coordinate
                              addressDictionary:@{@"name":@"temp"}];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = self.hotelName;
    return mapItem;
}

@end
