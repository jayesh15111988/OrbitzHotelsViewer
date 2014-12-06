//
//  MainTabBarController.m
//  OrbitzHotelsViewer
//
//  Created by Jayesh Kawli Backup on 11/27/14.
//  Copyright (c) 2014 Jayesh Kawli Backup. All rights reserved.
//

#import "MainTabBarController.h"
#import "OrbitzHotel.h"
#import "HotelsParser.h"
#import "OrbitzHotelsListViewController.h"
#import "OrbitzHotelsMapViewController.h"

@implementation MainTabBarController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    //Two view controllers one for listing hotels and other for displaying hotels on the map
    
    OrbitzHotelsListViewController* hotelsListViewController = (OrbitzHotelsListViewController*) self.viewControllers[0];
    OrbitzHotelsMapViewController* hotelsMapViewController = (OrbitzHotelsMapViewController*) self.viewControllers[1];
    
    hotelsListViewController.hotelsObjectsList = [HotelsParser getListOfHotelsObjectsFromFileWithName:@"hotels" andType:@"json"];
     hotelsMapViewController.hotelsObjectsList = hotelsListViewController.hotelsObjectsList;
     hotelsMapViewController.orbitzHotelsListViewController = hotelsListViewController;
    
    NSDictionary *titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [UIFont systemFontOfSize:14], NSFontAttributeName, nil];

    //customizing font size on the hotels list
    for(UIViewController *tab in  self.viewControllers) {
        [tab.tabBarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
}



@end
