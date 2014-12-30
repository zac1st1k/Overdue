//
//  XZZEditTaskViewController.m
//  Overdue
//
//  Created by Zac on 16/12/2014.
//  Copyright (c) 2014 1st1k. All rights reserved.
//

#import "XZZEditTaskViewController.h"

@interface XZZEditTaskViewController ()

@end

@implementation XZZEditTaskViewController

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
    self.editTaskNameLabel.text = self.task.title;
    self.editTaskTextLabel.text = self.task.description;
    self.editTaskDatePicker.date = self.task.date;
    self.editTaskNameLabel.delegate = self;
    self.editTaskTextLabel.delegate =self;
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

- (IBAction)editTaskSaveBarButtonPressed:(id)sender {
    [self updateTask];
    [self.delegate didUpdateTask];
}

- (void)updateTask
{
    self.task.title = self.editTaskNameLabel.text;
    self.task.description = self.editTaskTextLabel.text;
    self.task.date = self.editTaskDatePicker.date;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.editTaskNameLabel resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [self.editTaskTextLabel resignFirstResponder];
        return NO;
    }
    return YES;
}


@end
