//
//  XZZAddTaskViewController.m
//  Overdue
//
//  Created by Zac on 16/12/2014.
//  Copyright (c) 2014 1st1k. All rights reserved.
//

#import "XZZAddTaskViewController.h"

@interface XZZAddTaskViewController ()

@end

@implementation XZZAddTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (XZZTask *)returnNewTaskObject
{
    XZZTask *taskObject = [[XZZTask alloc] init];
    taskObject.title = self.addTaskNameTextField.text;
    taskObject.description = self.addTaskTextView.text;
    taskObject.date = self.addTaskDatePicker.date;
    taskObject.isCompleted = NO;
    
    return taskObject;
}

- (IBAction)addTaskAddButtonPressed:(id)sender {
    [self.delegate didAddTask:[self returnNewTaskObject]];
    
}

- (IBAction)addTaskCancelButtonPressed:(id)sender {
    [self.delegate didCancel];
}
@end
