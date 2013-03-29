//
//  BMWNote.h
//  MapNotes2
//
//  Created by Benjamin Wang on 3/28/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BMWLocation;

@interface BMWNote : NSManagedObject

@property (nonatomic, retain) NSString * titleString;
@property (nonatomic, retain) NSString * detailString;
@property (nonatomic, retain) BMWLocation *location;
@property (nonatomic, retain) NSDate *date;

@end
