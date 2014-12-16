//
//  XZZDetailTaskViewController.h
//  Overdue
//
//  Created by Zac on 16/12/2014.
//  Copyright (c) 2014 1st1k. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZZDetailTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *detailTaskNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailTaskTextLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailTaskDateLabel;

- (IBAction)detailTaskEditBarButtonPressed:(id)sender;

@end
