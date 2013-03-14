//
//  BMWNoteObject.h
//  MapNotes2
//
//  Created by Benjamin Wang on 3/13/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface BMWNoteObject : NSObject

@property (nonatomic, strong) NSDate *currentDate;
@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NSString *detailString;
@property CLLocationCoordinate2D coordinate;

@end
