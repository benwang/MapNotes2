//
//  BMWLocation.h
//  MapNotes2
//
//  Created by Benjamin Wang on 3/28/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BMWNote;

@interface BMWLocation : NSManagedObject

@property (nonatomic) double lat;
@property (nonatomic) double lon;
@property (nonatomic, retain) BMWNote *note;

@end
