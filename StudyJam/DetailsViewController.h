//
//  DetailViewController.h
//  AddressBook
//
//  Created by Gabriel Theodoropoulos on 9/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

/*
 
 This view controller is the one in charge of displaying the contacts detail page when a contact is selected
 on the table view of the FriendsTableViewContoller. Also allows the user to call or text a given contact
 directly from our app!
 
 */

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface DetailsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate, MFMessageComposeViewControllerDelegate>

//Things that will be displayed on the Contact Detail Page
@property (nonatomic, strong) NSDictionary *dictContactDetails;
@property (nonatomic, weak) IBOutlet UILabel *lblContactName;
@property (nonatomic, weak) IBOutlet UIImageView *imgContactImage;
@property (nonatomic, weak) IBOutlet UITableView *tblContactDetails;

// Methods that make calls and send texts
-(IBAction)makeCall:(id)sender;
-(IBAction)sendSMS:(id)sender;

@end
