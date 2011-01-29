//
//  AddSubjectViewController.m
//  CollegeNotes
//
//  Created by Mohamad Ariau Akbar on 1/26/11.
//  Copyright 2011 Techbars.com. All rights reserved.
//

#import "AddSubjectViewController.h"
#import "Subject.h"


@implementation AddSubjectViewController

@synthesize subjectTextField;
//@synthesize managedObjectContext;
@synthesize subject;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	self.title = @"New Subject";
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
	self.navigationItem.leftBarButtonItem = cancelButton;
	[cancelButton release];
	
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
	self.navigationItem.rightBarButtonItem = saveButton;
	[saveButton release];
	
	//subjectTextField.text = @"hai";
	subjectTextField.placeholder = @"New Subject";
	[subjectTextField becomeFirstResponder];
	//[subjectTextField resignFirstResponder];
//background = [UIColor groupTableViewBackgroundColor];
	
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	if (textField == subjectTextField) {
		
		[subjectTextField resignFirstResponder];
		//[self save];
	}
	
	return YES;
}

-(void)save {
	
	
	subject.subjectName = subjectTextField.text;
	
	[self dismissModalViewControllerAnimated:YES];
}

-(void)cancel {
	
	[self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	[subject release];
	[subjectTextField release];
    [super dealloc];
}


@end
