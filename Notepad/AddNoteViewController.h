//
//  AddNoteViewController.h
//  Notepad
//
//  Created by Daniel Trujillo on 10/7/12.
//  Copyright (c) 2012 DTRUPENN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@protocol AddNoteViewControllerDelegate;

@interface AddNoteViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <AddNoteViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UITextView *noteInput;
@property (weak, nonatomic) IBOutlet MKMapView *myMap;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;


@end

@protocol AddNoteViewControllerDelegate <NSObject>
- (void)addNoteViewControllerDidCancel:(AddNoteViewController *)controller;
- (void)addNoteViewControllerDidFinish:(AddNoteViewController *)controller title:(NSString *)title note:(NSString *)note;
@end