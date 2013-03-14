//
//  BMWDetailViewController.h
//  MapNotes2
//
//  Created by Benjamin Wang on 3/13/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "BMWNoteObject.h"

@interface BMWDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) BMWNoteObject *detailItem;
@property (weak, nonatomic) IBOutlet UITextView *detailTitle;
@property (weak, nonatomic) IBOutlet UITextView *detailContent;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet MKMapView *detailMap;

- (void) addPinToMapAtCoordinate:(CLLocationCoordinate2D) coordinate;


@end
