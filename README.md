DropDownTable
=============

[![Twitter: @kyramckenna](http://img.shields.io/badge/contact-%40kyramckenna-70a1fb.svg?style=flat)](https://twitter.com/Kyra_epi)

This framework creates a drop down table view which you can use on a touch event. The example app uses the framework to display a dropdown list from a TextField and TextView. But you could call it on any iOS event. It could also be a center screen pop up.

![Preview](https://github.com/kyramckenna/ScreenShots/blob/master/iphoneDropDown.jpg)

How to install
-------

When you initially download and unzip the file you will see the following files.

![Preview](https://github.com/kyramckenna/ScreenShots/blob/master/FileList.png)

Create your new project and drag the DropdownDialog.framework file into your "Embedded Binaries". 

![Preview](https://github.com/kyramckenna/ScreenShots/blob/master/HowToAddFramework.png)

This action will automatically add the file to the "Linked Framework and Libraries" and into your project as shown below:

![Preview](https://github.com/kyramckenna/ScreenShots/blob/master/framework_pic.png)


How to use the framework
-----
In your download I have provided a sample app which uses the DropDownDialog.framework called DropDownTable

1. Import the framework into the View you are using (#import <DropdownDialog/DropdownDialog.h>). I do this in "MyTableViewController"
2. Now add the delegate <DropDownViewDelegate>
3. Create an reference to the class @property (strong,nonatomic) DropDownView *dropDownView;
4. Create an array of items. In my example I created three arrays of pre-populated NStrings (firstData, secondData, thirdData). But you could just create this dynamically.
5. Create a method to catch events for Textfields and TextAreas eg: -(void)textViewDidBeginEditing:(UITextView *)textView
6. Inside this event, initialise the dropdown table. This is where you specify the contents and dimensions of your dropdown table. Dont forget to set the "tag" value and set the "delegate" to self! The just add this "dropdownview" to the current view you are in ( [self.view addSubview:dropDownView.view];) and then call open animation to make the table appear!
        
        NSString *tag = @"distance";
        
        dropDownView = [[DropDownView alloc] initWithArrayData:self.thirdData tag:tag cellHeight:30 heightTableView:height widthTableView:width paddingTop:0 paddingLeft:0 paddingRight:0 refView:myRect];
        
        dropDownView.delegate = self;
        [self.view addSubview:dropDownView.view];
        [dropDownView openAnimation];
        
7. Implement the delegate method to get the String information that the User clicked on. You can use the "tag" you set earlier to determine which textfield/view etc was selected:
    -(void)dropDownCellSelected:(NSString*)tagName itemChosen:(NSString*)item{
    
      if([tagName  isEqual: @"place"]){
          self.firstTextField.text = item;
      }else if([tagName  isEqual: @"route"]){
          self.secondTextView.text = item;
      }else if([tagName  isEqual: @"distance"]){
          self.thirdTextField.text = item;
      }

      // Close dropdown view
      [dropDownView closeAnimation];
    
      // Stop scrolling
      [self.tableView setContentOffset:self.tableView.contentOffset animated:NO];
    }

8. Close the drop down table:   [dropDownView closeAnimation];

Sizing the Dropdown Table
-----

So you need to specify the content (NSArray) and then the height, width and left starting position. You can do this using a variety of ways. I have given examples of creating the dropdown table in the center of the UIView by using the TableCell GRect and adding extra values to alter the position

        //calculate height of the dropdown table - height of rows * number of rows
        CGFloat height = 30 * 5;
        
        //calculate the width of the dropdown table
        CGFloat width = textField.frame.size.width/2;
        
        // If you want to get the drop-down list to drop from the textfield
        UITableViewCell *clickedCell = _firstCell;
        NSIndexPath *clickedButtonIndexPath = [self.tableView indexPathForCell:clickedCell];
        CGRect myRect = [self.tableView rectForRowAtIndexPath:clickedButtonIndexPath];
        myRect.origin.x -= width/5; // center of the table
        myRect.origin.y += 60;

Then you can add these values when creating the DropDownTable

        dropDownView = [[DropDownView alloc] initWithArrayData:self.thirdData tag:tag cellHeight:30 heightTableView:height widthTableView:width paddingTop:0 paddingLeft:0 paddingRight:0 refView:myRect];
        
        dropDownView.delegate = self;
        
