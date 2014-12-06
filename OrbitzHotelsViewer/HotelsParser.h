//
//  HotelsParser.h
//  OrbitzHotelsViewer
//
//  Created by Jayesh Kawli Backup on 12/5/14.
//  Copyright (c) 2014 Jayesh Kawli Backup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelsParser : NSObject
+(NSArray*)getListOfHotelsObjectsFromFileWithName:(NSString*)localFileName andType:(NSString*)fileType;
@end
