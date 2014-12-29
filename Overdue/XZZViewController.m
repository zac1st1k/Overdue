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
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    NSArray *taskAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:TASK_OBJECTS_KEY];
    for (NSDictionary *dictionary in taskAsPropertyLists) {
        XZZTask *taskObject = [self taskObjectForDictionary:dictionary];
        [self.taskObjects addObject:taskObject];
    }
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
    // forgot to setObject
    [[NSUserDefaults standardUserDefaults] setObject:taskObjectsAsPropertyLists forKey:TASK_OBJECTS_KEY];
    
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

- (XZZTask *)taskObjectForDictionary:(NSDictionary *)dictionary
{
    XZZTask *taskObject = [[XZZTask alloc] initWithData:dictionary];
    return taskObject;
}

- (BOOL)isDateGreaterThanDate:(NSDate *)date and:(NSDate *)toDate
{
    NSTimeInterval dateInterval = [date timeIntervalSince1970];
    NSTimeInterval toDateInterval = [toDate timeIntervalSince1970];
    NSLog(@"%f, %f", dateInterval, toDateInterval);
    if (dateInterval > toDateInterval) {
        return YES;
    } else {
        return NO;
    }
}

- (void)updateCompletionOfTask:(XZZTask *)task forIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *taskObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:TASK_OBJECTS_KEY] mutableCopy];
    if (!taskObjectsAsPropertyLists) {
        taskObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    }
    [taskObjectsAsPropertyLists removeObjectAtIndex:indexPath.row];
    if (task.isCompleted == YES) {
        task.isCompleted = NO;
    } else {
        task.isCompleted = YES;
    }
    [taskObjectsAsPropertyLists insertObject:[self taskObjectAsPropertyList:task] atIndex:indexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:taskObjectsAsPropertyLists forKey:TASK_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.tableView reloadData];
}

#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.taskObjects count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //Configure the cell...
    
    XZZTask *task = self.taskObjects[indexPath.row];
    cell.textLabel.text = task.title;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:task.date];
    cell.detailTextLabel.text = stringFromDate;
    BOOL isOverDue = [self isDateGreaterThanDate:[NSDate date] and:task.date];
    
    if (task.isCompleted == YES){
        cell.backgroundColor = [UIColor grayColor];
    }
    else if (isOverDue == YES) {
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
//        cell.backgroundColor = [UIColor yellowColor];
    }
    
    
    return cell;
}

#pragma mark -UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XZZTask *task = self.taskObjects[indexPath.row];
    [self updateCompletionOfTask:task forIndexPath:indexPath];
}

@end
