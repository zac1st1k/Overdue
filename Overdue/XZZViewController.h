//
//  XZZViewController.h
//  Overdue
//
//  Created by Zac on 15/12/2014.
//  Copyright (c) 2014 1st1k. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZZAddTaskViewController.h"
#import "XZZDetailTaskViewController.h"

@interface XZZViewController : UIViewController <XZZAddTaskViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *taskObjects;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *reloadBarButton;

- (IBAction)addTaskBarButtonPressed:(id)sender;
- (IBAction)reloadBarButtonPressed:(id)sender;

@end
