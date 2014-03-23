//
//  MapViewController.m
//  StudyJam
//
//  Created by Andy Russell on 3/1/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import "MapViewController.h"





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
    _swipeInRightGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeInFromRightEdge:)];
    [_swipeInRightGestureRecognizer setEdges:UIRectEdgeRight];
    [_mapView addGestureRecognizer:_swipeInRightGestureRecognizer];
    _swipeInRightGestureRecognizer.delegate = self;
    self.view.backgroundColor = [UIColor blackColor];
    
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    

}

- (IBAction)handleSwipeInFromRightEdge:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
- (IBAction)toMain:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
@end
