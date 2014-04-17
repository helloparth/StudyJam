//
//  FriendTableViewController.h
//  StudyJam
//
//  Created by Andy Russell on 4/14/14.
//  Copyright (c) 2014 StudyJam, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface FriendTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource, ABPeoplePickerNavigationControllerDelegate>

@property (nonatomic, strong) NSMutableArray *arrContactsData;

@end
