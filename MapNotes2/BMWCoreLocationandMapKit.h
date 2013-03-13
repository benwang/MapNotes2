//
//  BMWCoreLocationandMapKit.h
//  MapNotes2
//
//  Created by Benjamin Wang on 3/13/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface BMWCoreLocationandMapKit : NSObject <MKMapViewDelegate, CLLocationManagerDelegate> {
    MKMapView *mapView;
    CLLocationManager *locationManager;
}

@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

+ (id)sharedManager;

//moved to BMWDetailViewController
//- (void) addPinToMapAtLocation:(CLLocation *) location;

- (void) stopUpdating;

- (void) resumeUpdating;



@end
