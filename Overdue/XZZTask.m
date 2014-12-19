//
//  XZZTask.m
//  Overdue
//
//  Created by Zac on 16/12/2014.
//  Copyright (c) 2014 1st1k. All rights reserved.
//

#import "XZZTask.h"

@implementation XZZTask

- (id)init;
{
    self = [self initWithData:nil];
    return self;
}

- (id)initWithData:(NSDictionary *)data;
{
    self = [super init];
    self.title = @"Task1";
    self.description = @"First task";
   // NSDateFormatter *date = [NSDate dateWithTimeIntervalSinceReferenceDate:118800];
    self.date = [[NSDateFormatter init] dateFromString:@"15/01/1986"];
    self.completion = NO;
    NSLog(@"init %@", self);
    return self;
    }
@end
