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
@property (weak, nonatomic) IBOutlet UIImageView *jarImageView;
@property CATransition *labelAnimation;
@end

@implementation StudyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.studyState = [StudyState new];
    
    self.swipeInLeftGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeInFromLeftEdge:)];
    [self.swipeInLeftGestureRecognizer setEdges:UIRectEdgeLeft];
    [self.view addGestureRecognizer:_swipeInLeftGestureRecognizer];
    
    self.swipeInRightGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeInFromRightEdge:)];
    [self.swipeInRightGestureRecognizer setEdges:UIRectEdgeRight];
    [self.view addGestureRecognizer:self.swipeInRightGestureRecognizer];

}

-(void)viewDidAppear:(BOOL)animated {
    [self.studyLabel setText:[self.studyState getStudyLevelText]];
    self.jarImageView.image = [self changeColorForImage:self.jarImageView.image toColor:[self.studyState getStudyLevelColor]];
    
    // Add animation to label
    self.labelAnimation = [CATransition animation];
    self.labelAnimation.duration = 1.0;
    self.labelAnimation.type = kCATransitionFade;
    self.labelAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
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


- (UIImage *) changeColorForImage:(UIImage *)image toColor:(UIColor*)color {
    UIGraphicsBeginImageContext(image.size);
    
    CGRect contextRect;
    contextRect.origin.x = 0.0f;
    contextRect.origin.y = 0.0f;
    contextRect.size = [image size];

    CGSize itemImageSize = [image size];
    CGPoint itemImagePosition;
    itemImagePosition.x = ceilf((contextRect.size.width - itemImageSize.width) / 2);
    itemImagePosition.y = ceilf((contextRect.size.height - itemImageSize.height) );
    
    UIGraphicsBeginImageContext(contextRect.size);
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextBeginTransparencyLayer(c, NULL);
    CGContextScaleCTM(c, 1.0, -1.0);
    CGContextClipToMask(c, CGRectMake(itemImagePosition.x, -itemImagePosition.y, itemImageSize.width, -itemImageSize.height), [image CGImage]);
    const float* colors = CGColorGetComponents( color.CGColor );
    CGContextSetRGBFillColor(c, colors[0], colors[1], colors[2], 1);
    
    contextRect.size.height = -contextRect.size.height;
    contextRect.size.height -= 15;
    CGContextFillRect(c, contextRect);
    CGContextEndTransparencyLayer(c);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (IBAction)detectUpSwipe:(id)sender {
    [self.studyState increaseFocus];
    [self.studyLabel setText:@""];
    [self.studyLabel.layer addAnimation:self.labelAnimation forKey:@"changeTextTransition"];
    [self.studyLabel setText:[self.studyState getStudyLevelText]];
    
    [UIView animateWithDuration: FOCUS_ANIMATION_DURATION animations: ^{
        self.jarImageView.image = [self changeColorForImage:self.jarImageView.image toColor:[self.studyState getStudyLevelColor]];
    }];

}

- (IBAction)detectDownSwipe:(id)sender {
    [self.studyState decreaseFocus];
    [self.studyLabel setText:@""];
    [self.studyLabel.layer addAnimation:self.labelAnimation forKey:@"changeTextTransition"];
    [self.studyLabel setText:[self.studyState getStudyLevelText]];
    
    [UIView animateWithDuration: FOCUS_ANIMATION_DURATION animations: ^{
        self.jarImageView.image = [self changeColorForImage:self.jarImageView.image toColor:[self.studyState getStudyLevelColor]];
    }];
}
    
@end