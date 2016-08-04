//
//  MyTableViewController.h
//  DropDownTable
//
//  Created by Kyra McKenna on 03/08/2016.
//  Copyright © 2016 mckenna. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UITextView *secondTextView;
@property (weak, nonatomic) IBOutlet UITextField *thirdTextField;

@property (weak, nonatomic) IBOutlet UITableViewCell *firstCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *secondCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *thirdCell;

@end
