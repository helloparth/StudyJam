//
//  ZHCustomSegue.m
//  StudyJam
//
//  Created by jarthur on 3/4/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//


#import "ZHCustomSegue.h"
#import "QuartzCore/QuartzCore.h"


@implementation ZHCustomSegue

// Not gonna lie, i have no idea how this actually works. I found the code for this at:
// http://blog.jambura.com/2012/07/05/custom-segue-animation-left-to-right-using-catransition/

-(void)perform {
    
    UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
    UIViewController *destinationController = (UIViewController*)[self destinationViewController];
    
    CATransition* transition = [CATransition animation];
    transition.duration = .25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    
    transition.subtype = kCATransitionFromRight; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    
    
    
    [sourceViewController.navigationController.view.layer addAnimation:transition
                                                                forKey:kCATransition];
    
    [sourceViewController.navigationController pushViewController:destinationController animated:NO];
    
}

@end

