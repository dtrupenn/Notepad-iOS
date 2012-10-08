//
//  NoteDataController.m
//  Notepad
//
//  Created by Daniel Trujillo on 10/7/12.
//  Copyright (c) 2012 DTRUPENN. All rights reserved.
//

#import "NoteDataController.h"
#import "Note.h"

@interface NoteDataController ()
- (void)initializeDefaultDataList;
@end

@implementation NoteDataController

@synthesize masterNoteList = _masterNoteList;

- (void)initializeDefaultDataList {
    NSMutableArray *noteList = [[NSMutableArray alloc] init];
    self.masterNoteList = noteList;
    [self addNoteWithTitle:@"Welcome" content:@"Welcome to Notepad!"];
}

- (void)setMasterNoteList:(NSMutableArray *)newList {
    if (_masterNoteList != newList) {
        _masterNoteList = [newList mutableCopy];
    }
}

- (id)init {
    if (self = [super init]) {
        NSMutableArray *noteList = [[NSMutableArray alloc] init];
        self.masterNoteList = noteList;
        return self;
    }
    return nil;
}

- (NSUInteger)countOfList {
    return [self.masterNoteList count];
}


- (Note *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterNoteList objectAtIndex:theIndex];
}

- (void)addNoteWithTitle:(NSString *)inputTitle content:(NSString *) inputContent {
    Note *theNote;
    NSDate *today = [NSDate date];
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    theNote = [[Note alloc] initWithTitle:inputTitle content:inputContent location:locationManager date:today];
    [self.masterNoteList addObject:theNote];
}

- (void)removeObjectAtIndex:(NSUInteger)theIndex {
    [self.masterNoteList removeObjectAtIndex:theIndex];
}

@end
