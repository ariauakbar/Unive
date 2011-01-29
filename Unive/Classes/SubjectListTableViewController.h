//
//  SubjectListTableViewController.h
//  CollegeNotes
//
//  Created by Mohamad Ariau Akbar on 1/26/11.
//  Copyright 2011 Techbars.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddSubjectViewController.h"
#import "SubjectDetailTableViewController.h"
#import <CoreData/CoreData.h>

#import "Subject.h"

//@class Subject;
@interface SubjectListTableViewController : UITableViewController {

	//UINavigationController *navigationController;
	NSArray *subjectArray;
	
	NSManagedObjectContext *managedObjectContext;
	NSFetchedResultsController *fetchedResultsController;

}

@property (nonatomic, retain) NSArray	*subjectArray;
//@property(nonatomic, retain)UINavigationController *navigationController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
-(void)addSubject:(id)sender;
-(void)showSubjectDetail:(NSString *)subject andAnimated:(BOOL)animated;

@end
