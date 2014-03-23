//
//  MapViewController.h
//  StudyJam
//
//  Created by Andy Russell on 3/1/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController

- (IBAction)zoomIn:(id)sender;
- (IBAction)toMain:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
