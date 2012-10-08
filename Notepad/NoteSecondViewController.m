//
//  NoteSecondViewController.m
//  Notepad
//
//  Created by Daniel Trujillo on 10/7/12.
//  Copyright (c) 2012 DTRUPENN. All rights reserved.
//

#import "NoteSecondViewController.h"
#import "NoteMasterViewController.h"

@interface NoteSecondViewController ()

@end

@implementation NoteSecondViewController

@synthesize mapView, myControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)locate:(id)sender {
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
    [mapView setMapType:MKMapTypeStandard];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    MKCoordinateRegion region = { {0.0, 0.0}, {0.0, 0.0} };
    region.center.latitude = locationManager.location.coordinate.latitude;
    region.center.longitude = locationManager.location.coordinate.longitude;
    region.span.longitudeDelta = 0.007f;
    region.span.latitudeDelta = 0.007f;
    [mapView setRegion:region animated:YES];
    [mapView setDelegate:sender];
    
    //Adding Annotation
    [mapView setCenterCoordinate:locationManager.location.coordinate];
    MKPointAnnotation* annot = [[MKPointAnnotation alloc] init];
    [annot setCoordinate: locationManager.location.coordinate];
    [annot setTitle:@"My location"];
    
    [mapView addAnnotation:annot];
}

- (IBAction)segmentedButton:(id)sender {
    switch (myControl.selectedSegmentIndex) {
        case 0:
            [mapView setMapType:MKMapTypeStandard];
            break;
            
        case 1:
            [mapView setMapType:MKMapTypeHybrid];
            break;
            
        case 2:
            [mapView setMapType:MKMapTypeSatellite];
            break;
            
        default:
            break;
    }
}
@end
