//
//  StudyAnnotation.m
//  StudyJam
//
//  Created by Andy Russell on 4/16/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import "StudyAnnotation.h"

@implementation StudyAnnotation

-(id) initWithTitle:(NSString *)title andLocation:(CLLocationCoordinate2D)location andColor:(UIColor*)color {
    self = [super init];
    if(self) {
        _title = title;
        _coordinate = location;
        _color = color;
    }
    
    return self;
}

+(UIImage *) createImageForColor:(UIColor*)color {
    
    CGRect rect = CGRectMake(0, 0, 20, 20);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

-(MKAnnotationView *) annotationView {
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"StudyAnnotation"];
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [StudyAnnotation createImageForColor:_color];
    return annotationView;
}

@end