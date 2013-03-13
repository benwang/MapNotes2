//
//  BMWMasterViewController.h
//  MapNotes2
//
//  Created by Benjamin Wang on 3/13/13.
//  Copyright (c) 2013 Benjamin Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BMWDetailViewController;

@interface BMWMasterViewController : UITableViewController

@property (strong, nonatomic) BMWDetailViewController *detailViewController;

@end
