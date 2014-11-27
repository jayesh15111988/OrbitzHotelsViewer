//
//  OrbitzHotelsMapViewController.m
//  OrbitzHotelsViewer
//
//  Created by Jayesh Kawli Backup on 11/27/14.
//  Copyright (c) 2014 Jayesh Kawli Backup. All rights reserved.
//

#import "OrbitzHotelsMapViewController.h"
#import "HotelsAnnotation.h"
#import "OrbitzHotel.h"
#import <UIImageView+WebCache.h>
#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface OrbitzHotelsMapViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *hotelsMap;
@end

@implementation OrbitzHotelsMapViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    [self plotHotelsOnMap:self.hotelsObjectsList];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)plotHotelsOnMap:(NSArray *)hotelsList {
    for (id<MKAnnotation> annotation in self.hotelsMap.annotations) {
        [self.hotelsMap removeAnnotation:annotation];
    }
    
    
    NSInteger hotelsObjectCount = 0;
    
    
    for (OrbitzHotel *individualHotel in hotelsList) {

        if(hotelsObjectCount == 0){
            hotelsObjectCount++;
            CLLocationCoordinate2D zoomLocation;
            zoomLocation.latitude = individualHotel.hotelLatitude;
            zoomLocation.longitude= individualHotel.hotelLongitude;
            
            // 2
            MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
            
            // 3
            [self.hotelsMap setRegion:viewRegion animated:YES];
        }
        
        NSString* hotelName = individualHotel.hotelName;
        
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = individualHotel.hotelLatitude;
        coordinate.longitude = individualHotel.hotelLongitude;
        HotelsAnnotation *annotation = [[HotelsAnnotation alloc] initWithHotelName:hotelName andStreetAddress:individualHotel.streetAddress coordinate:coordinate] ;
        annotation.remoteImageURL = individualHotel.hotelImageURL;
        [self.hotelsMap addAnnotation:annotation];
    }
}

#pragma MapView delegate methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"HotelLocation";
    
    if ([annotation isKindOfClass:[HotelsAnnotation class]]) {
        MKAnnotationView *annotationView = (MKAnnotationView *) [self.hotelsMap dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView.canShowCallout = YES;
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"pin.png"];
        } else {
            annotationView.annotation = annotation;
        }
        
        HotelsAnnotation* anno = (HotelsAnnotation*)annotation;
        NSLog(@"URL is %@",anno.remoteImageURL);
        
        UIImageView* hotelImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
        [hotelImageView sd_setImageWithURL:anno.remoteImageURL];
        
        annotationView.leftCalloutAccessoryView = hotelImageView;
        
        return annotationView;
    }
    
    return nil;
}

@end
