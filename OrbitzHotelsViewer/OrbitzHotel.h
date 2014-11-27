//
//  OrbitzHotel.h
//  OrbitzHotelsViewer
//
//  Created by Jayesh Kawli Backup on 11/27/14.
//  Copyright (c) 2014 Jayesh Kawli Backup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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


/*

 distance":"0.07",
 "direction":"S",
 "star_rating":"5",
 "name":"The Peninsula Chicago",
 "nightly_rate":"625.00",
 "promoted_nightly_rate":"625.00",
 "total_rate":"1439.10",
 "longitude":-87.625,
 "latitude":41.895200000000003,
 "master_id":160098,
 "thumbnail":"http://www.tnetnoc.com//hotelimages/298/84298/12556121/TBNL0-20100125-100011-293.jpg",
 "street_address":"108 East Superior Street",
 "review_score":5.0

*/