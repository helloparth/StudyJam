//
//  XYZDetailViewController.h
//  AddressBook
//
//  Created by jarthur on 4/16/14.
//  Copyright (c) 2014 jarthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *lblContactName;
@property (nonatomic, weak) IBOutlet UIImageView *imgContactImage;
@property (nonatomic, weak) IBOutlet UITableView *tblContactDetails;

@end
