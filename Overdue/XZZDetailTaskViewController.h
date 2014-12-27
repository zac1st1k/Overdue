//
//  XZZDetailTaskViewController.h
//  Overdue
//
//  Created by Zac on 16/12/2014.
//  Copyright (c) 2014 1st1k. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZZDetailTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *detailTaskTaskLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailTaskDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailTaskDetailLabel;

- (IBAction)detailTaskEditBarButtonPressed:(id)sender;

@end
