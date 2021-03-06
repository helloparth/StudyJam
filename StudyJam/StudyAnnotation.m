//
//  StudyAnnotation.m
//  StudyJam
//
//  Created by Andy Russell on 4/16/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import <MessageUI/MessageUI.h>

#import "StudyAnnotation.h"

@implementation StudyAnnotation

-(id) initWithTitle:(NSString *)title andLocation:(CLLocationCoordinate2D)location andColor:(UIColor*)color andNumber: (NSString*)phoneNumber {
    self = [super init];
    if(self) {
        _title = title;
        _coordinate = location;
        _color = color;
        _phoneNumber = phoneNumber;
    }
    
    return self;
}

+(UIImage *) createImageForColor:(UIColor*)color {
    
    CGRect rect = CGRectMake(0, 0, 20, 20);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    path.lineWidth = 3;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineCapStyle = kCGLineCapRound;
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    //[[UIColor whiteColor] setStroke];
    [color setFill];
    [path fill];
    //[path stroke];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

-(MKAnnotationView *) annotationView {
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"StudyAnnotation"];
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [StudyAnnotation createImageForColor:_color];
    annotationView.layer.masksToBounds = NO;
    annotationView.layer.shadowColor = [[UIColor blackColor] CGColor];
    annotationView.layer.shadowOffset = CGSizeMake(1, 1);
    annotationView.layer.shadowRadius = 7;
    annotationView.layer.shadowOpacity = 0.5;
    UIButton *callButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *textButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    callButton.frame = CGRectMake(10.0, 10.0, 40.0, 40.0);
    textButton.frame = CGRectMake(10.0, 10.0, 40.0, 40.0);
    
    [callButton setTitle:@"Call" forState:UIControlStateNormal];
    [callButton addTarget:self action:@selector(callPhoneNumber) forControlEvents:UIControlEventTouchUpInside];
    [textButton setTitle:@"Text" forState:UIControlStateNormal];
    [textButton addTarget:self action:@selector(textPhoneNumber) forControlEvents:UIControlEventTouchUpInside];
    
    annotationView.leftCalloutAccessoryView = callButton;
    annotationView.rightCalloutAccessoryView = textButton;
    
    return annotationView;
}

-(void) callPhoneNumber {
    NSString *phoneURL = [@"telprompt://" stringByAppendingString:_phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneURL]];
}

-(void) textPhoneNumber {
    // TODO: Figure out how to present view controller from an annotationView
    NSString *smsURL = [@"sms://" stringByAppendingString:_phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:smsURL]];
}

@end