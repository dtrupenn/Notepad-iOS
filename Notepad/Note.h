//
//  Note.h
//  Notepad
//
//  Created by Daniel Trujillo on 10/7/12.
//  Copyright (c) 2012 DTRUPENN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Note : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) CLLocationManager *location;
@property (nonatomic, strong) NSDate *date;

-(id)initWithTitle:(NSString *)title content:(NSString *)content location:(CLLocationManager *)location date:(NSDate *)date;

@end
