//
//  AddNoteViewController.m
//  Notepad
//
//  Created by Daniel Trujillo on 10/7/12.
//  Copyright (c) 2012 DTRUPENN. All rights reserved.
//

#import "AddNoteViewController.h"

@interface AddNoteViewController ()

@end

@implementation AddNoteViewController

@synthesize titleInput = _titleInput, noteInput = _noteInput, myMap = _myMap;
@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [super viewDidLoad];
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        locationManager.distanceFilter = kCLDistanceFilterNone;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [locationManager startUpdatingLocation];
        
        [self.myMap setMapType:MKMapTypeStandard];
        [self.myMap setZoomEnabled:YES];
        [self.myMap setScrollEnabled:YES];
        MKCoordinateRegion region = { {0.0, 0.0}, {0.0, 0.0} };
        region.center.latitude = locationManager.location.coordinate.latitude;
        region.center.longitude = locationManager.location.coordinate.longitude;
        region.span.longitudeDelta = 0.007f;
        region.span.latitudeDelta = 0.007f;
        [self.myMap setRegion:region animated:YES];
        
        //Adding Annotation
        [self.myMap setCenterCoordinate:locationManager.location.coordinate];
        MKPointAnnotation* annot = [[MKPointAnnotation alloc] init];
        [annot setCoordinate: locationManager.location.coordinate];
        [annot setTitle:@"Current Location"];
        
        [self.myMap addAnnotation:annot];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
    [_myMap setMapType:MKMapTypeStandard];
    [_myMap setZoomEnabled:YES];
    [_myMap setScrollEnabled:YES];
    MKCoordinateRegion region = { {0.0, 0.0}, {0.0, 0.0} };
    region.center.latitude = locationManager.location.coordinate.latitude;
    region.center.longitude = locationManager.location.coordinate.longitude;
    region.span.longitudeDelta = 0.007f;
    region.span.latitudeDelta = 0.007f;
    [_myMap setRegion:region animated:YES];
    
    //Adding Annotation
    [_myMap setCenterCoordinate:locationManager.location.coordinate];
    MKPointAnnotation* annot = [[MKPointAnnotation alloc] init];
    [annot setCoordinate: locationManager.location.coordinate];
    [annot setTitle:@"Current Location"];
    
    [_myMap addAnnotation:annot];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.titleInput) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)viewDidUnload
{
    [self setTitleInput:nil];
    [self setNoteInput:nil];
    [super viewDidUnload];
}

- (IBAction)cancel:(id)sender {
    [[self delegate] addNoteViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    BOOL locationAllowed = [CLLocationManager locationServicesEnabled];
    CLAuthorizationStatus allowed = [CLLocationManager authorizationStatus];
    NSLog(@"LocationAllowed: %s", locationAllowed ? "true" : "false");
    
    if (locationAllowed==NO || allowed != kCLAuthorizationStatusAuthorized) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Service Disabled"
                                                        message:@"To re-enable, please go to Settings and turn on Location Service for this app."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        //[alert release];
    } else {
        [[self delegate] addNoteViewControllerDidFinish:self title:self.titleInput.text note:self.noteInput.text];
    }
}
@end
