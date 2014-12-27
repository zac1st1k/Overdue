//
//  XZZViewController.h
//  Overdue
//
//  Created by Zac on 15/12/2014.
//  Copyright (c) 2014 1st1k. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZZViewController : UIViewController

- (IBAction)addTaskBarButtonPressed:(id)sender;
- (IBAction)reloadBarButtonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *teableView;

@end
