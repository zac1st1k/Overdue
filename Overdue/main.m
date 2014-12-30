//
//  main.m
//  Overdue
//
//  Created by Zac on 15/12/2014.
//  Copyright (c) 2014 1st1k. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZZTask.h"
#import "XZZAppDelegate.h"

@protocol XZZEditTaskViewControllerDelegate <NSObject>

- (void)didUpdateTask;

@end
int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([XZZAppDelegate class]));
    }
}
