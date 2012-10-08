//
//  NoteSecondViewController.h
//  Notepad
//
//  Created by Daniel Trujillo on 10/7/12.
//  Copyright (c) 2012 DTRUPENN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@class NoteDataController;

@interface NoteSecondViewController : UIViewController

@property (strong, nonatomic) NoteDataController *notes;
@property (weak, nonatomic) IBOutlet UISegmentedControl *myControl;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)locate:(id)sender;
- (IBAction)segmentedButton:(id)sender;

@end
