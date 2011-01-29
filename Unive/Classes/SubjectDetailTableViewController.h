//
//  SubjectDetailTableViewController.h
//  CollegeNotes
//
//  Created by Mohamad Ariau Akbar on 1/26/11.
//  Copyright 2011 Techbars.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNotesViewController.h"
#import "AddToDoViewController.h"

@interface SubjectDetailTableViewController : UITableViewController {
	
	UIWindow *window;
	NSString *subject;
	
	UIToolbar *toolbar;

}

-(void)addNotes:(id)sender;
-(void)addTodos:(id)sender;

@property (nonatomic, retain) IBOutlet UIWindow *window;
//@property(nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) NSString *subject;
@property (nonatomic, retain) UIToolbar *toolbar;

@end
