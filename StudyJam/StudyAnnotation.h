//
//  StudyAnnotation.h
//  StudyJam
//
//  Created by Andy Russell on 4/16/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface StudyAnnotation : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic) UIColor *color;

-(id) initWithTitle:(NSString*)title andLocation:(CLLocationCoordinate2D)location andColor: (UIColor*)color;
+(UIImage*) createImageForColor:(UIColor*)color;
-(MKAnnotationView*) annotationView;

@end