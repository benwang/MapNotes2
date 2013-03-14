//
//  BMWAddNoteViewController.m
//  MapNotes2
//
//  Created by Benjamin Wang on 3/13/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import "BMWAddNoteViewController.h"

@interface BMWAddNoteViewController ()

@end

@implementation BMWAddNoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelModalViewController:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneWithModalViewController:(id)sender
{
    //first save the data
    appDelegate = (BMWAppDelegate *)[[UIApplication sharedApplication] delegate];
    BMWNoteObject *object = [[BMWNoteObject alloc] init];
    object.titleString = titleField.text;
    object.detailString = contentField.text;
    object.currentDate = [NSDate date];
    BMWCoreLocationandMapKit *sharedManager = [BMWCoreLocationandMapKit sharedManager];
    object.coordinate = sharedManager.locationManager.location.coordinate;
    
    //then set it as object in table array
    [appDelegate.objects addObject:object];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
