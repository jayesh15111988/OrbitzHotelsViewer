//
//  OrbitzHotelsListViewController.h
//  OrbitzHotelsViewer
//
//  Created by Jayesh Kawli Backup on 11/27/14.
//  Copyright (c) 2014 Jayesh Kawli Backup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrbitzHotelsListViewController : UIViewController
@property (strong, nonatomic) NSArray* hotelsObjectsList;
@property (assign, nonatomic) NSInteger selectedRowFromTable;
@end
