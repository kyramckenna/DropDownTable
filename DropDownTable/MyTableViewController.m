//
//  MyTableViewController.m
//  DropDownTable
//
//  Created by Kyra McKenna on 03/08/2016.
//  Copyright © 2016 mckenna. All rights reserved.
//

#import "MyTableViewController.h"
#import <DropdownDialog/DropdownDialog.h>

@interface MyTableViewController () <DropDownViewDelegate>

@property (strong,nonatomic) DropDownView *dropDownView;
@property (strong,nonatomic) NSArray *firstData;
@property (strong,nonatomic) NSArray *secondData;
@property (strong,nonatomic) NSArray *thirdData;
@end

@implementation MyTableViewController

@synthesize dropDownView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstData = @[@"Chloe Hosking (Aus)",
                       @"Lotta Lepistö (Fin)",
                       @"Marianne Vos (Ned) ",
                       @"Joelle Numainville (Can)",
                       @"Roxane Fournier (Fra)",
                       @"Pascale Jeuland (Fra)",
                       @"Tiffany Cromwell (Aus)",
                       @"Joanne Kiesanowski (NZl)",
                       @"Lotte Kopecky (Bel)"
                       ];
    
    self.secondData = @[@"Mont Saint-Michel to Utah Beach, Sainte-Marie-du-Mont",
                        @"Saint-Lô to Cherbourg-Octeville",
                        @"Granville to Angers",
                        @"Saumur to Limoges",
                        @"Limoges to Le Lioran",
                        @"Arpajon-sur-Cère to Montauban",
                        @"L'Isle-Jourdain to Lac de Payolle",
                        @"Pau to Bagnères-de-Luchon",
                        @"Vielha Val d'Aran (Spain) to Andorra-Arcalis (Andorra)",
                        @"Escaldes-Engordany (Andorra) to Revel"
                        ];
    
    self.thirdData = @[@"188 km",
                            @"183 km",
                            @"223.5 km",
                            @"237.5 km",
                            @"216 km",
                            @"190.5 km",
                            @"162.5 km",
                            @"184 km",
                            @"184.5 km",
                            @"197 km"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


/*
 Position of the Drop down table requires
 HEIGHT
 WIDTH
 ORIGIN POINT
 */

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView isEqual:self.secondTextView]) {
        
        [textView resignFirstResponder];
        [self hideKeyboard];
        
        // HEIGHT
        NSString *tag = @"route";
        CGFloat height = 30 * 5;
        
        // WIDTH
        CGFloat width = textView.frame.size.width - 50;
        
        // ORIGIN POINT
        UITableViewCell *clickedCell = _secondCell;
        NSIndexPath *clickedButtonIndexPath = [self.tableView indexPathForCell:clickedCell];
        CGRect myRect = [self.tableView rectForRowAtIndexPath:clickedButtonIndexPath];
        myRect.origin.x -= width/5; // center of the table
        myRect.origin.y += 30;
        
        dropDownView = [[DropDownView alloc] initWithArrayData:self.secondData tag:tag cellHeight:30 heightTableView:height widthTableView:width paddingTop:-8 paddingLeft:-5 paddingRight:-10 refView:myRect];
        
        dropDownView.delegate = self;
        
        [self.view addSubview:dropDownView.view];
        [dropDownView openAnimation];
        
        // Stop scrolling
        [self.tableView setContentOffset:self.tableView.contentOffset animated:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [dropDownView closeAnimation];
    
    if ([textField isEqual:self.firstTextField] && [self.firstData count] > 0) {
        
        [textField resignFirstResponder];
        [self hideKeyboard];
        
        NSString *tag = @"place";
        
        //calculate height of the dropdown table - height of rows * number of rows
        CGFloat height = 30 * 5;
        
        //calculate the width of the dropdown table
        CGFloat width = 290;
        
        // If you want to get the drop-down list to drop from the textfield
        UITableViewCell *clickedCell = _firstCell;
        NSIndexPath *clickedButtonIndexPath = [self.tableView indexPathForCell:clickedCell];
        CGRect myRect = [self.tableView rectForRowAtIndexPath:clickedButtonIndexPath];
        myRect.origin.x -= width/5; // center of the table
        myRect.origin.y += 60;
        
        dropDownView = [[DropDownView alloc] initWithArrayData:self.firstData tag:tag cellHeight:30 heightTableView:height widthTableView:width paddingTop:-8 paddingLeft:-5 paddingRight:-10 refView:myRect];
        
        dropDownView.delegate = self;
        
        [self.view addSubview:dropDownView.view];
        [dropDownView openAnimation];
        
        // Stop scrolling
        [self.tableView setContentOffset:self.tableView.contentOffset animated:NO];
    }
    else if ([textField isEqual:self.thirdTextField]) {
        
        [textField resignFirstResponder];
        [self hideKeyboard];
        
        NSString *tag = @"distance";
        CGFloat height = 30 * 7;
        
        // Width of the Dropdown
        CGFloat width = textField.frame.size.width/2;
        
        // If you want to get the drop-down list to drop from the textfield
        // change the origin point
        UITableViewCell *clickedCell = _thirdCell;
        NSIndexPath *clickedButtonIndexPath = [self.tableView indexPathForCell:clickedCell];
        CGRect myRect = [self.tableView rectForRowAtIndexPath:clickedButtonIndexPath];
        CGRect myRectForXPosition = self.thirdTextField.frame;
        myRect.origin.x -= myRectForXPosition.origin.x/2; // at the start of the Times textfield
        myRect.origin.y += 30;
        
        dropDownView = [[DropDownView alloc] initWithArrayData:self.thirdData tag:tag cellHeight:30 heightTableView:height widthTableView:width paddingTop:0 paddingLeft:0 paddingRight:0 refView:myRect];
        
        dropDownView.delegate = self;
        
        [self.view addSubview:dropDownView.view];
        [dropDownView openAnimation];
        
        // Stop scrolling
        [self.tableView setContentOffset:self.tableView.contentOffset animated:NO];
    }
}

#pragma mark DropDownViewDelegate

-(void)dropDownCellSelected:(NSString*)tagName itemChosen:(NSString*)item{
    
    if([tagName  isEqual: @"place"]){
        self.firstTextField.text = item;
    }else if([tagName  isEqual: @"route"]){
        self.secondTextView.text = item;
        
        for(int i=0; i<[self.secondData count]; i++){
            NSString *routeItem = [self.secondData objectAtIndex:i];
            if([routeItem isEqual:item]){
                NSString *value = [self.thirdData objectAtIndex:i];
                self.thirdTextField.text = value;
            }
        }
    }else if([tagName  isEqual: @"distance"]){
        self.thirdTextField.text = item;
        
        for(int i=0; i<[self.thirdData count]; i++){
            NSString *distanceItem = [self.thirdData objectAtIndex:i];
            if([distanceItem isEqual:item]){
                NSString *value = [self.secondData objectAtIndex:i];
                self.secondTextView.text = value;
            }
        }
    }

    // Close dropdown view
    [dropDownView closeAnimation];
    
    // Stop scrolling
    [self.tableView setContentOffset:self.tableView.contentOffset animated:NO];
}

#pragma mark Hide Keyboard

- (void) hideKeyboard {
    
    // Hide all keyboard except the current one
    [self.firstTextField resignFirstResponder];
    [self.secondTextView resignFirstResponder];
    
    [self.view endEditing:YES];
}

@end
