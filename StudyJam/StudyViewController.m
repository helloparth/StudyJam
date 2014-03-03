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

- (IBAction)handleSwipeInFromLeftEdge:(id)sender {
    [self performSegueWithIdentifier:@"Map" sender:self];
}

- (IBAction)handleSwipeInFromRightEdge:(id)sender {
    [self performSegueWithIdentifier:@"Friends" sender:self];
}


- (IBAction)detectUpSwipe:(id)sender {
    [_studyState increaseFocus];
    [_studyLabel setText:[NSString stringWithFormat:@"StudyLevel %d", _studyState.studyLevel]];
    
    [UIView animateWithDuration: FOCUS_ANIMATION_DURATION animations: ^{
        self.view.backgroundColor = [self getColorForFocusLevel:_studyState];
    }];
}

- (IBAction)detectDownSwipe:(id)sender {
    [_studyState decreaseFocus];
    [_studyLabel setText:[NSString stringWithFormat:@"StudyLevel %d", _studyState.studyLevel]];
    
    [UIView animateWithDuration: FOCUS_ANIMATION_DURATION animations: ^{
        self.view.backgroundColor = [self getColorForFocusLevel:_studyState];
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

- (id)getColorForFocusLevel: (StudyState *) state {
    switch (state.studyLevel) {
        case 0:
            return [UIColor greenColor];
            break;
            
        case 1:
            return [UIColor yellowColor];
            break;
            
        case 2:
            return [UIColor orangeColor];
            break;
            
        case 3:
            return [UIColor redColor];
            break;
            
        default:
            return [UIColor whiteColor];
    }
}
    
@end
