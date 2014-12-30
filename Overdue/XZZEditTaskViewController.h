//
//  XZZEditTaskViewController.h
//  Overdue
//
//  Created by Zac on 16/12/2014.
//  Copyright (c) 2014 1st1k. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZZTask.h"

@protocol XZZEditTaskViewControllerDelegate <NSObject>

- (void)didUpdateTask;

@end

@interface XZZEditTaskViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) XZZTask *task;
@property (weak, nonatomic) id <XZZEditTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *editTaskNameLabel;
@property (strong, nonatomic) IBOutlet UITextView *editTaskTextLabel;
@property (strong, nonatomic) IBOutlet UIDatePicker *editTaskDatePicker;

- (IBAction)editTaskSaveBarButtonPressed:(id)sender;

@end
