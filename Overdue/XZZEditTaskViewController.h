//
//  XZZEditTaskViewController.h
//  Overdue
//
//  Created by Zac on 16/12/2014.
//  Copyright (c) 2014 1st1k. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZZTask.h"

@interface XZZEditTaskViewController : UIViewController

@property (strong, nonatomic) XZZTask *task;

@property (strong, nonatomic) IBOutlet UITextField *editTaskNameLabel;
@property (strong, nonatomic) IBOutlet UITextView *editTaskTextLabel;
@property (strong, nonatomic) IBOutlet UIDatePicker *editTaskDatePicker;

- (IBAction)editTaskSaveBarButtonPressed:(id)sender;

@end
