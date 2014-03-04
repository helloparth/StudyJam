//
//  ViewController.m
//  StudyJam
//
//  Created by Andy Russell on 2/18/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import "StudyViewController.h"
#import "StudyState.h"

static const NSTimeInterval FOCUS_ANIMATION_DURATION = 1.00;

@interface StudyViewController ()
@property StudyState *studyState;
@property IBOutlet UILabel *studyLabel;
@property UIScreenEdgePanGestureRecognizer *swipeInLeftGestureRecognizer;
@property UIScreenEdgePanGestureRecognizer *swipeInRightGestureRecognizer;
@end

@implementation StudyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_studyState = [StudyState new];
    
    // FIXME: Figure out how to limit calls to the delegate
    _swipeInLeftGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeInFromLeftEdge:)];
    [_swipeInLeftGestureRecognizer setEdges:UIRectEdgeLeft];
    [self.view addGestureRecognizer:_swipeInLeftGestureRecognizer];
    
    _swipeInRightGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeInFromRightEdge:)];
    [_swipeInRightGestureRecognizer setEdges:UIRectEdgeRight];
    [self.view addGestureRecognizer:_swipeInRightGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleSwipeInFromLeftEdge:(UIGestureRecognizer*)recognizer {
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [self performSegueWithIdentifier:@"Map" sender:self];
    }
}

- (void)handleSwipeInFromRightEdge:(UIGestureRecognizer*)recognizer {
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [self performSegueWithIdentifier:@"Friends" sender:self];
    }
}


- (IBAction)detectUpSwipe:(id)sender {
    [_studyState increaseFocus];
    [_studyLabel setText:[NSString stringWithFormat:@"StudyLevel %d", _studyState.studyLevel]];
    
    [UIView animateWithDuration: FOCUS_ANIMATION_DURATION animations: ^{
        self.view.backgroundColor = [_studyState getStudyLevelColor];
    }];
}

- (IBAction)detectDownSwipe:(id)sender {
    [_studyState decreaseFocus];
    [_studyLabel setText:[NSString stringWithFormat:@"StudyLevel %d", _studyState.studyLevel]];
    
    [UIView animateWithDuration: FOCUS_ANIMATION_DURATION animations: ^{
        self.view.backgroundColor = [_studyState getStudyLevelColor];
    }];
}

- (IBAction)detectTap:(id)sender {
    _studyLabel.alpha = 1.0;
    [UIView animateWithDuration:1.0
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         _studyLabel.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

    
@end
