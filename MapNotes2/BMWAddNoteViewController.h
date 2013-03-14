//
//  BMWAddNoteViewController.h
//  MapNotes2
//
//  Created by Benjamin Wang on 3/13/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMWNoteObject.h"
#import "BMWAppDelegate.h"
#import "BMWCoreLocationandMapKit.h"

@interface BMWAddNoteViewController : UIViewController
{
    IBOutlet UITextField *titleField;
    IBOutlet UITextView *contentField;
    BMWAppDelegate *appDelegate;
}

@property (nonatomic, strong) BMWCoreLocationandMapKit *locationManager;

- (IBAction)cancelModalViewController:(id)sender;
- (IBAction)doneWithModalViewController:(id)sender;

@end
