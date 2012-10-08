//
//  NoteDetailViewController.m
//  Notepad
//
//  Created by Daniel Trujillo on 10/7/12.
//  Copyright (c) 2012 DTRUPENN. All rights reserved.
//

#import "NoteDetailViewController.h"
#import "Note.h"

@interface NoteDetailViewController ()

@end

@implementation NoteDetailViewController

@synthesize note = _note, titleLabel = _titleLabel, contentLabel = _contentLabel, dateLabel = _dateLabel, locationLabel = _locationLabel;

- (void)setNote:(Note *)newNote
{
    if (_note != newNote) {
        _note = newNote;
        
        // Update the view.
        [self configureView];
        
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    Note *theNote = self.note;
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    if (theNote) {
        self.titleLabel.text = theNote.title;
        self.contentLabel.text = theNote.content;
        self.locationLabel.text = [NSString stringWithFormat:@"(%1.2f, %1.2f)", theNote.location.location.coordinate.latitude, theNote.location.location.coordinate.longitude];
        self.dateLabel.text = [formatter stringFromDate:(NSDate *)theNote.date];
                
        //Setting Map
        [self.noteMap setMapType:MKMapTypeStandard];
        [self.noteMap setZoomEnabled:YES];
        [self.noteMap setScrollEnabled:YES];
        MKCoordinateRegion region = { {0.0, 0.0}, {0.0, 0.0} };
        region.center.latitude = theNote.location.location.coordinate.latitude;
        region.center.longitude = theNote.location.location.coordinate.longitude;
        region.span.longitudeDelta = 0.007f;
        region.span.latitudeDelta = 0.007f;
        [self.noteMap setRegion:region animated:YES];
        
        //Adding Annotation
        [self.noteMap setCenterCoordinate:theNote.location.location.coordinate];
        MKPointAnnotation* annot = [[MKPointAnnotation alloc] init];
        [annot setCoordinate: theNote.location.location.coordinate];
        [annot setTitle:theNote.title];
        
        [self.noteMap addAnnotation:annot];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self configureView];
}

- (void)viewDidUnload
{
    self.note = nil;
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
