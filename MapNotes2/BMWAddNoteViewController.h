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
#import "BMWDataManager.h"

@interface BMWAddNoteViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>
{
    BMWAppDelegate *appDelegate;
}

@property (nonatomic, strong) BMWCoreLocationandMapKit *locationManager;
@property (weak,nonatomic) IBOutlet UITextField *titleField;
@property (weak,nonatomic) IBOutlet UITextView *contentField;

- (IBAction)cancelModalViewController:(id)sender;
- (IBAction)doneWithModalViewController:(id)sender;

@end
