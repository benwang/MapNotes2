//
//  BMWDetailViewController.h
//  MapNotes2
//
//  Created by Benjamin Wang on 3/13/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMWDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
