//
//  NoteMasterViewController.h
//  Notepad
//
//  Created by Daniel Trujillo on 10/7/12.
//  Copyright (c) 2012 DTRUPENN. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NoteDataController;

@interface NoteMasterViewController : UITableViewController

@property (strong, nonatomic) NoteDataController *dataController;


@end
