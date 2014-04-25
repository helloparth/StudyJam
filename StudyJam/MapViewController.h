//
//  MapViewController.h
//  StudyJam
//
//  Created by Andy Russell on 3/1/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <UIGestureRecognizerDelegate, MKMapViewDelegate, MFMessageComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *locationButton;



@property UIScreenEdgePanGestureRecognizer *swipeInRightGestureRecognizer;

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation;
- (IBAction)zoomIn:(UIBarButtonItem *)sender;
- (IBAction)changeMap:(id)sender;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
