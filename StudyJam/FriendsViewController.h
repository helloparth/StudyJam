//
//  ContactsViewController.h
//  StudyJam
//
//  Created by Andy Russell on 3/1/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import "ZHCustomSegue.h"

@interface FriendsViewController : UINavigationController <ABPeoplePickerNavigationControllerDelegate>


- (IBAction)addFriend:(id)sender;


@property (nonatomic, strong) NSArray *myContacts;

@end
