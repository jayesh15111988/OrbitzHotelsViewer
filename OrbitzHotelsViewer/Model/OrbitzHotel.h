//
//  OrbitzHotel.h
//  OrbitzHotelsViewer
//
//  Created by Jayesh Kawli Backup on 11/27/14.
//  Copyright (c) 2014 Jayesh Kawli Backup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define HOTEL_SELECTED_NOTIFICATIONS @"hotelselectedfromlist"

@interface OrbitzHotel : NSObject
@property (nonatomic, strong) NSString* direction;
@property (nonatomic, assign) CGFloat distance;
@property (nonatomic, strong) NSString* starRating;
@property (nonatomic, strong) NSString* hotelName;
@property (nonatomic, assign) CGFloat nightlyRate;
@property (nonatomic, assign) CGFloat promotedNightlyRate;
@property (nonatomic, assign) CGFloat totalRate;
@property (nonatomic, assign) CGFloat hotelLatitude;
@property (nonatomic, assign) CGFloat hotelLongitude;
@property (nonatomic, assign) NSInteger masterIdentifier;
@property (nonatomic, strong) NSURL* hotelImageURL;
@property (nonatomic, strong) NSString* streetAddress;
@property (nonatomic, assign) CGFloat reviewScore;
@end
