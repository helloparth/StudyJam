//
//  MapViewController.m
//  StudyJam
//
//  Created by Andy Russell on 3/1/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import "APIConnection.h"
#import "MapViewController.h"
#import "StudyAnnotation.h"
#import "StudyState.h"

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [APIConnection getFriendsById:@"4045130232" responseHandler:^(NSDictionary *response) {
        // TODO: Get nearby friends only
        for (id friend in [response objectForKey:@"friends"]) {
            [APIConnection getLocationById:friend responseHandler:^(NSDictionary *response) {
                NSDictionary *locations = [response objectForKey:@"locations"];
                double latitude = [[locations objectForKey:@"latitude"] doubleValue];
                double longitude = [[locations objectForKey:@"longitude"] doubleValue];
                int studyLevelValue = [[locations objectForKey:@"study_level"] intValue];
                StudyState *studyState = [[StudyState alloc] initWithLevel:studyLevelValue];
                
                CLLocationCoordinate2D location = CLLocationCoordinate2DMake(latitude, longitude);
                
                StudyAnnotation *annot = [[StudyAnnotation alloc] initWithTitle:@"Parth Patel" andLocation:location andColor: [studyState getStudyLevelColor] andNumber:@"4045130232"];
                annot.coordinate = location;
                [self.mapView addAnnotation:annot];
            }];
        }
    }];
    
    _swipeInRightGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeInFromRightEdge:)];
    [_swipeInRightGestureRecognizer setEdges:UIRectEdgeRight];
    [_mapView addGestureRecognizer:_swipeInRightGestureRecognizer];
    _swipeInRightGestureRecognizer.delegate = self;
    self.view.backgroundColor = [UIColor blackColor];
    
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
}

- (IBAction)handleSwipeInFromRightEdge:(UIGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self performSegueWithIdentifier:@"Slider" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zoomIn:(id)sender {
    MKUserLocation *userLocation = _mapView.userLocation;
    [self mapView: _mapView didUpdateUserLocation: userLocation];
    
}

- (IBAction)changeMap:(id)sender {
    if (_mapView.mapType == MKMapTypeStandard)
        _mapView.mapType = MKMapTypeSatellite;
    else
        _mapView.mapType = MKMapTypeStandard;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion mapRegion;
    mapRegion.center = mapView.userLocation.coordinate;
    mapRegion.span.latitudeDelta = 0.01;
    mapRegion.span.longitudeDelta = 0.01;
    
    [mapView setRegion:mapRegion animated: YES];
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if([annotation isKindOfClass:[StudyAnnotation class]]) {
        StudyAnnotation *studyAnnotation = (StudyAnnotation*)annotation;
        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"StudyAnnotation"];
        
        if (annotationView == nil) {
            annotationView = studyAnnotation.annotationView;
        } else {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    } else {
        return nil;
    }
}

-(void)makeCallToNumber:(NSString *)numberToCall{
    NSString *telephoneString=[numberToCall stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSMutableString *str1=[[NSMutableString alloc] initWithString:telephoneString];
    
    [str1 setString:[str1 stringByReplacingOccurrencesOfString:@"(" withString:@""]];
    
    [str1 setString:[str1 stringByReplacingOccurrencesOfString:@")" withString:@""]];
    
    [str1 setString:[str1 stringByReplacingOccurrencesOfString:@"-" withString:@""]];
    
    [str1 setString:[str1 stringByReplacingOccurrencesOfString:@" " withString:@""]];
    
    telephoneString = [@"tel://" stringByAppendingString:str1];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:telephoneString]]) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telephoneString]];
        
    }
    
}

-(void)sendSMSToNumber:(NSString *)numberToSend{
    if (![MFMessageComposeViewController canSendText]) {
        NSLog(@"Unable to send SMS message.");
    }
    else {
        MFMessageComposeViewController *sms = [[MFMessageComposeViewController alloc] init];
        [sms setMessageComposeDelegate:self];
        
        [sms setRecipients:[NSArray arrayWithObjects:numberToSend, nil]];
        [sms setBody:@"This is a SMS message from Appcoda.com"];
        [self presentViewController:sms animated:YES completion:nil];
    }
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
