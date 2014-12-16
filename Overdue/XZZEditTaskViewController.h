//
//  XZZEditTaskViewController.h
//  Overdue
//
//  Created by Zac on 16/12/2014.
//  Copyright (c) 2014 1st1k. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZZEditTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *editTaskNameLabel;
@property (strong, nonatomic) IBOutlet UITextView *editTaskTextLabel;

- (IBAction)editTaskSaveBarButtonPressed:(id)sender;

@end
