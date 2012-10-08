//
//  NoteDataController.h
//  Notepad
//
//  Created by Daniel Trujillo on 10/7/12.
//  Copyright (c) 2012 DTRUPENN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@class Note;

@interface NoteDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterNoteList;

- (NSUInteger)countOfList;
- (Note *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addNoteWithTitle:(NSString *)inputTitle content:(NSString *)inputContent;
- (void)removeObjectAtIndex:(NSUInteger)theIndex;
- (void)setMasterNoteList:(NSMutableArray *)newList;

@end
