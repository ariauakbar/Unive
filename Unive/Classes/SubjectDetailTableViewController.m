//
//  SubjectDetailTableViewController.m
//  CollegeNotes
//
//  Created by Mohamad Ariau Akbar on 1/26/11.
//  Copyright 2011 Techbars.com. All rights reserved.
//

#import "SubjectDetailTableViewController.h"


@implementation SubjectDetailTableViewController
@synthesize window;
//@synthesize navigationController;
@synthesize subject;
@synthesize toolbar;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	//top navigation bar
	self.title = subject;
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
																				 target:self action:@selector(addTodos:)];
	self.navigationItem.rightBarButtonItem = rightButton;
	[rightButton release];
	
	//bottom UIToolbar area
	UIBarButtonItem *makeNotes = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(addNotes:)];
	UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	NSArray *items = [NSArray arrayWithObjects:space, space, space, makeNotes, nil];
	
	toolbar = [[UIToolbar alloc] init];
	[toolbar setItems:items animated:YES];
	toolbar.barStyle = UIBarStyleDefault;
	
	// create toolbar Rectangle programmaticaly
	[toolbar sizeToFit];
	CGFloat toolbarHeight = [toolbar frame].size.height; // get Toolbar Height
	CGFloat mainViewHeight = CGRectGetHeight(self.view.bounds); // get current view height
	[toolbar setFrame:CGRectMake(0, mainViewHeight - toolbarHeight, 320, 50)];
	
	[self.view addSubview:toolbar];
	
	[makeNotes release];
	[space release];

		
}

-(void)addNotes:(id)sender {
	
	AddNotesViewController *addNotesViewController = [[AddNotesViewController alloc] initWithNibName:@"AddNotesViewController" bundle:nil];
	UINavigationController *aNavigationController = [[UINavigationController alloc] initWithRootViewController:addNotesViewController];
	
	[self presentModalViewController:aNavigationController animated:YES];
	
	[addNotesViewController release];
	[aNavigationController release];
	
}

-(void)addTodos:(id)sender {
	
	AddToDoViewController *addTodoViewController = [[AddToDoViewController alloc] initWithNibName:@"AddTodoViewController" bundle:nil];
	UINavigationController *aNavigationController = [[UINavigationController alloc] initWithRootViewController:addTodoViewController];
	aNavigationController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	
	[self presentModalViewController:aNavigationController animated:YES];
	
	[addTodoViewController release];
	[aNavigationController release];
	
}
/*
- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	SubjectDetailTableViewController *subjectDetail = [[SubjectDetailTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
	
	UINavigationController *aNavigationController = [[UINavigationController alloc] initWithRootViewController:subjectDetail];
	self.navigationController = aNavigationController;
	
	[window addSubview:aNavigationController.view];
	[window makeKeyAndVisible];
	
	//[window release];
	[subjectDetail release];
	[aNavigationController release];
	
}
 
 */


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *title = nil;
	
	switch (section) {
		case 0:
			title = @"ToDos";
			break;
		case 1:
			title = @"Notes";
			break;
	}
	
	return title;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


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
	[subject release];
	[toolbar release];
    [super dealloc];
}


@end

