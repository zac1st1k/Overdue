//
//  XZZAddTaskViewController.h
//  Overdue
//
//  Created by Zac on 16/12/2014.
//  Copyright (c) 2014 1st1k. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZZAddTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *addTaskNameTextField;
@property (strong, nonatomic) IBOutlet UITextView *addTaskTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *addTaskDatePicker;

- (IBAction)addTaskAddButtonPressed:(id)sender;
- (IBAction)addTaskCancelButtonPressed:(id)sender;

@end
