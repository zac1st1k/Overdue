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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    XZZTask *mytask;
    [mytask initWithData:nil];
    NSLog(@"%@", mytask);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTaskBarButton:(id)sender {
}

- (IBAction)addTaskBarButtonPressed:(id)sender {
}

- (IBAction)reloadBarButtonPressed:(id)sender {
}
@end
