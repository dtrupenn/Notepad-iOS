//
//  Note.m
//  Notepad
//
//  Created by Daniel Trujillo on 10/7/12.
//  Copyright (c) 2012 DTRUPENN. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize title = _title, content = _content, location = _location, date = _date;

-(id)initWithTitle:(NSString *)title content:(NSString *)content location:(CLLocationManager *)location date:(NSDate *)date {
    self = [super init];
    if(self) {
        _title = title;
        _content = content;
        _location = location;
        _date = date;
        return self;
    }
    return nil;
}

@end
