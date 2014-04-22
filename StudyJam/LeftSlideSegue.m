//
//  LeftSlideSegue.m
//  StudyJam
//
//  Created by Andy Russell on 4/21/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import "LeftSlideSegue.h"

@implementation LeftSlideSegue

-(void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    CATransition *transition = [CATransition animation];
    transition.duration = .25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    
    NSLog(@"TRANSITION");
    
    [sourceViewController.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    [sourceViewController.navigationController pushViewController:destinationViewController animated:NO];
}

@end
