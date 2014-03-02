//
//  ContactsViewController.m
//  StudyJam
//
//  Created by Andy Russell on 3/1/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import "FriendsViewController.h"
#import <AddressBook/AddressBook.h>

@interface FriendsViewController ()
@property NSArray *allPeople;
@property UIScreenEdgePanGestureRecognizer *swipeInLeftGestureRecognizer;
@end

@implementation FriendsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _swipeInLeftGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeInFromLeftEdge:)];
    [_swipeInLeftGestureRecognizer setEdges:UIRectEdgeLeft];
    [self.view addGestureRecognizer:_swipeInLeftGestureRecognizer];
    
    CFErrorRef error = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
    if (addressBook != nil) {
        _allPeople = (__bridge_transfer NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
    } else {
        NSLog(@"Error retrieving address book");
    }
}

- (IBAction)handleSwipeInFromLeftEdge:(id)sender {
   [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
