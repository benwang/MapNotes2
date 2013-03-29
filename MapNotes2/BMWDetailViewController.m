//
//  BMWDetailViewController.m
//  MapNotes2
//
//  Created by Benjamin Wang on 3/13/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import "BMWDetailViewController.h"
#import "BMWCoreLocationandMapKit.h"

@interface BMWDetailViewController ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

- (void)configureView;

@end


@implementation BMWDetailViewController

#pragma mark - Managing the detail item

//- (void)setDetailItem:(id)newDetailItem
//{
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//        
//        // Update the view.
//        [self configureView];
//    }
//
//    if (self.masterPopoverController != nil) {
//        [self.masterPopoverController dismissPopoverAnimated:YES];
//    }        
//}

- (void)configureView
{
    // Update the user interface for the detail item.
    
//  I put this in viewDidLoad instead
//    self.detailDescriptionLabel.text = [_detailItem.currentDate description];
//    self.detailTitle.text = _detailItem.titleString;
//    self.detailContent.text = _detailItem.detailString;
//    self.detailMap.mapType = MKMapTypeStandard;
//    [self addPinToMapAtCoordinate:_detailItem.coordinate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    // Getting object information from _detailItem (and it's attached BMWLocation, originially passed from AppDelegate
    self.detailDescriptionLabel.text = [_detailItem.date description];
    self.detailTitle.text = _detailItem.titleString;
    self.detailContent.text = _detailItem.detailString;
    self.detailMap.mapType = MKMapTypeStandard;
    
    location.latitude = _detailItem.location.lat;
    location.longitude = _detailItem.location.lon;
    [self addPinToMapAtCoordinate:location];
    
    // Set background to pattern
    UIImage *patternImage = [UIImage imageNamed:@"fabric_of_squares_gray.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:patternImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Map commands
- (void) addPinToMapAtCoordinate:(CLLocationCoordinate2D) coordinate
{
    //this is the red pin
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = coordinate;
    
    //Labels, with latitude/longitude markings to two decimal places
    pin.title = @"Game watched here";
    float lat = coordinate.latitude;
    float lon = coordinate.longitude;
    pin.subtitle = [NSString stringWithFormat: @"lat: ~%f, lon: ~%f", lat, lon];
    
    //Add pin to map, puts center of screen at the pin
    [_detailMap addAnnotation:pin];
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
//    CLLocationCoordinate2D newCenter;
//    newCenter.latitude = location.coordinate.latitude;
//    newCenter.longitude = location.coordinate.longitude;
    region.span = span;
    region.center = coordinate;//no longer newCenter
    [_detailMap setRegion:region animated:YES];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Notes", @"Notes");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
