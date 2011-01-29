//
//  AddSubjectViewController.h
//  CollegeNotes
//
//  Created by Mohamad Ariau Akbar on 1/26/11.
//  Copyright 2011 Techbars.com. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "CollegeNotesAppDelegate.h"

@class Subject;
@interface AddSubjectViewController : UIViewController <UITextFieldDelegate>{

	IBOutlet UITextField *subjectTextField;
	//NSManagedObjectContext *managedObjectContext;
	
	Subject *subject;
	
}

@property (nonatomic, retain) UITextField *subjectTextField;
//@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) Subject *subject;

-(void)cancel;
-(void)save;
//-(void)save;

@end
