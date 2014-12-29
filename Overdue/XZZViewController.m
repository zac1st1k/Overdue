//
//  XZZViewController.m
//  Overdue
//
//  Created by Zac on 15/12/2014.
//  Copyright (c) 2014 1st1k. All rights reserved.
//

#import "XZZViewController.h"
#import "XZZTask.h"

@interface XZZViewController ()

@end

@implementation XZZViewController

- (NSMutableArray *)taskObjects
{
    if (!_taskObjects) {
        _taskObjects = [[NSMutableArray alloc] init];
    }
    return _taskObjects;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    XZZTask *mytask = [mytask initWithData:nil];
//    NSLog(@"%@", mytask);
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[XZZAddTaskViewController class]]) {
        XZZAddTaskViewController *addTaskViewController = segue.destinationViewController;
        addTaskViewController.delegate = self;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTaskBarButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"toAddTaskViewController" sender:nil];
}

- (IBAction)reloadBarButtonPressed:(id)sender {
}

#pragma mark - XZZAddTaskViewControllerDelegate

- (void)didAddTask:(XZZTask *)task
{
    [self.taskObjects addObject:task];
    NSMutableArray *taskObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASK_OBJECTS_KEY] mutableCopy];
    if (!taskObjectsAsPropertyLists) {
        taskObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    }
    [taskObjectsAsPropertyLists addObject:[self taskObjectAsPropertyList:task]];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
    NSLog(@"added!");

}

- (void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"cancelled!");
}

#pragma mark - Helper Methods

- (NSDictionary *)taskObjectAsPropertyList:(XZZTask *)taskObject
{
    NSDictionary *dictionary = @{TASK_TITLE: taskObject.title, TASK_DESCRIPTION: taskObject.description, TASK_DATE: taskObject.date, TASK_COMPLETION: @(taskObject.isCompleted)};
    return dictionary;
}

@end
