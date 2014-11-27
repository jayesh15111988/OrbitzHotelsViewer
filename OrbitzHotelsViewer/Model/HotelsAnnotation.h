//
//  HotelsAnnotation.h
//  OrbitzHotelsViewer
//
//  Created by Jayesh Kawli Backup on 11/27/14.
//  Copyright (c) 2014 Jayesh Kawli Backup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface HotelsAnnotation : NSObject<MKAnnotation>
@property (nonatomic, strong) NSString *hotelName;
@property (nonatomic, strong) NSString* hotelStreetAddress;
@property (nonatomic, strong) NSURL* hotelImageURL;
@property (nonatomic, assign) CLLocationCoordinate2D theCoordinate;
- (id)initWithHotelName:(NSString*)name andStreetAddress:(NSString*)streetAddress coordinate:(CLLocationCoordinate2D)coordinate;
@end
