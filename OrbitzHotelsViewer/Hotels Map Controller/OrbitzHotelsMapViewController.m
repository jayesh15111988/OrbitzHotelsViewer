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

//Decides the range of surrounding area which is visible at this moment
#define METERS_PER_MILE 1610

@interface OrbitzHotelsMapViewController ()<MKMapViewDelegate>
@property (weak,   nonatomic) IBOutlet MKMapView *hotelsMap;
@property (strong, nonatomic) NSMutableArray* annotationsHolder;
@end

@implementation OrbitzHotelsMapViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    self.annotationsHolder = [NSMutableArray new];
    self.hotelsMap.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.hotelsMap.layer.borderWidth = 1.0f;
    [self plotHotelsOnMap:self.hotelsObjectsList];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.topItem.title = @"Hotels On Map";
    //Now depending on the table row that we selected from list view expand annotation view on the map view
    if(self.orbitzHotelsListViewController.selectedRowFromTable != -1) {
        HotelsAnnotation* selectedHotelAnnotationFromList = self.annotationsHolder[self.orbitzHotelsListViewController.selectedRowFromTable];
        [self.hotelsMap selectAnnotation:selectedHotelAnnotationFromList animated:YES];
    }
}

- (void)plotHotelsOnMap:(NSArray *)hotelsList {
    
    if([self.hotelsMap.annotations count]) {
        for (id<MKAnnotation> annotation in self.hotelsMap.annotations) {
            [self.hotelsMap removeAnnotation:annotation];
        }
    }
    
    NSInteger hotelsObjectCount = 0;
    
    for (OrbitzHotel *individualHotel in hotelsList) {

        if(hotelsObjectCount == 0){
            hotelsObjectCount++;
            CLLocationCoordinate2D zoomLocation;
            zoomLocation.latitude = individualHotel.hotelLatitude;
            zoomLocation.longitude= individualHotel.hotelLongitude;
            
            MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
            
            [self.hotelsMap setRegion:viewRegion animated:YES];
        }
        
        NSString* hotelName = individualHotel.hotelName;
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = individualHotel.hotelLatitude;
        coordinate.longitude = individualHotel.hotelLongitude;
        HotelsAnnotation *annotation = [[HotelsAnnotation alloc] initWithHotelName:hotelName andStreetAddress:individualHotel.streetAddress coordinate:coordinate] ;
        annotation.hotelImageURL = individualHotel.hotelImageURL;
        [self.annotationsHolder addObject:annotation];
        [self.hotelsMap addAnnotation:annotation];
    }
}

#pragma MapView delegate methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *identifier = @"HotelLocation";
    
    if ([annotation isKindOfClass:[HotelsAnnotation class]]) {
        MKAnnotationView *annotationView = (MKAnnotationView *) [self.hotelsMap dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.image = [UIImage imageNamed:@"pin.png"];
        } else {
            annotationView.annotation = annotation;
        }
        
        HotelsAnnotation* currentHotelAnnotation = (HotelsAnnotation*)annotation;
        UIImageView* hotelImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
        
        if(currentHotelAnnotation.hotelImageURL) {
            [hotelImageView sd_setImageWithURL:currentHotelAnnotation.hotelImageURL];
        }
        else {
            [hotelImageView setImage:[UIImage imageNamed:@"placeholder_image.png"]];
        }
        annotationView.leftCalloutAccessoryView = hotelImageView;
        return annotationView;
    }
    return nil;
}

@end
