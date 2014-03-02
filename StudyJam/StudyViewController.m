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
@end

@implementation StudyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_studyState = [StudyState new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
                        options:UIViewAnimationCurveEaseInOut
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
            return [UIColor orangeColor];
            break;
            
        case 2:
            return [UIColor redColor];
            break;
            
        default:
            return [UIColor whiteColor];
    }
}

    
@end
