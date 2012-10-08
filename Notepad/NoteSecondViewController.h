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
@class Note;

@interface NoteSecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *myControl;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)segmentedButton:(id)sender;
- (void)update:(Note *)data;
- (void)remove:(NSString *) title;

@end
