//
//  SubjectListTableViewController.m
//  CollegeNotes
//
//  Created by Mohamad Ariau Akbar on 1/26/11.
//  Copyright 2011 Techbars.com. All rights reserved.
//

#import "SubjectListTableViewController.h"
#import "Subject.h"


@implementation SubjectListTableViewController

@synthesize subjectArray;
@synthesize managedObjectContext, fetchedResultsController;
//@synthesize navigationController;
#pragma mark -
#pragma mark View lifecycle


#pragma mark -
#pragma mark Table view data source

//- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
//	UINavigationController *aNavigationController = [[UINavigationController alloc] initWithRootViewController:<#(UIViewController *)rootViewController#>]
//}

-(void)viewDidLoad {
	
	self.title = @"CollegeNotes";
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	
	UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addSubject:)];
	self.navigationItem.rightBarButtonItem = addButtonItem;
	[addButtonItem release];
	
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
	self.navigationItem.backBarButtonItem = backButton;
	[backButton release];
	
	subjectArray = [[NSArray alloc] initWithObjects:@"Web Programming", @"Graphic Computer", @"Operating System", nil];
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [subjectArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell...
	cell.textLabel.text = [subjectArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *title = nil;
	
	if (section == 0) {
		
		title = @"Subjects";
		 
	}
	
	return title;
}
	

-(void)addSubject:(id)sender {
	
	AddSubjectViewController *addSubjectController = [[AddSubjectViewController alloc] initWithNibName:@"AddSubjectViewController" bundle:nil];
	//NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
	//NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
	
	// Crash on here !! can't find entity named Subject
	Subject *newSubject = (Subject *)[NSEntityDescription insertNewObjectForEntityForName:@"Subject" inManagedObjectContext:self.managedObjectContext];
	addSubjectController.subject = newSubject;
	
	UINavigationController *aNavigationController = [[UINavigationController alloc] initWithRootViewController:addSubjectController];
	[self presentModalViewController:aNavigationController animated:YES];
	
	
	[aNavigationController release];
	[addSubjectController release];
	
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
		//[subjectArray ]
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(void)showSubjectDetail:(NSString *)subject andAnimated:(BOOL)animated {
	
	SubjectDetailTableViewController *detailviewController = [[SubjectDetailTableViewController alloc] 
															  initWithNibName:@"SubjectDetailTableViewController"
															  bundle:nil];
	//[subject retain];
	detailviewController.subject = subject;
	
	[self.navigationController pushViewController:detailviewController animated:animated];
	[detailviewController release];
	[subject release];
}
#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	NSString *subject = [[NSString alloc] initWithFormat:@"%@", [subjectArray objectAtIndex:indexPath.row]];
	
	[self showSubjectDetail:subject andAnimated:YES];
	
		

	//[subjectDetailNavigationController release];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	
	[subjectArray release];
	[managedObjectContext release];
    [super dealloc];
}


@end

