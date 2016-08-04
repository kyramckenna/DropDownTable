DropDownTable
=============

[![Twitter: @kyramckenna](http://img.shields.io/badge/contact-%40Twitter-70a1fb.svg?style=flat)](https://twitter.com/Kyra_epi)   [![LinkedIn: @kyramckenna](http://img.shields.io/badge/contact-%40LinkedIn-4BC51D.svg?style=flat)](https://ie.linkedin.com/in/kyra-mckenna-a3372211)

This framework creates a drop down table view which you can use on a touch event. The example app uses the framework to display a dropdown list from a TextField and TextView. But you could call it on any iOS event. It could also be a center screen pop up.

![Preview](https://github.com/kyramckenna/ScreenShots/blob/master/iphoneDropDown.jpg)

How to install
-------

When you initially download and unzip the file you will see the following files.

![Preview](https://github.com/kyramckenna/ScreenShots/blob/master/FileList.png)

Create your new project and drag the DropdownDialog.framework file into your "Embedded Binaries". 

![Preview](https://github.com/kyramckenna/ScreenShots/blob/master/downloadFramework.gif)

This action will automatically add the file to the "Linked Framework and Libraries" and into your project as shown below:

![Preview](https://github.com/kyramckenna/ScreenShots/blob/master/framework_pic.png)


How to use the framework
-----
In your download I have provided a sample app which uses the DropDownDialog.framework called DropDownTable

1. Import the framework into the View you are using. I do this in the example app table view controller "MyTableViewController":
![Preview](https://github.com/kyramckenna/ScreenShots/blob/master/exportdropDown.png)
2. Now add the delegate:
![Preview](https://github.com/kyramckenna/ScreenShots/blob/master/adddropdownviewdelegate.png)
3. Create an reference to the class @property (strong,nonatomic) DropDownView *dropDownView;
![Preview](https://github.com/kyramckenna/ScreenShots/blob/master/referencedropdown.png)
4. Create an array of items. In my example I created three arrays of pre-populated NStrings (firstData, secondData, thirdData). But you could just create this dynamically.
5. Create a method to catch events for Textfields and TextAreas eg: -(void)textViewDidBeginEditing:(UITextView *)textView
6. Inside this event, initialise the dropdown table. This is where you specify the contents and dimensions of your dropdown table. Dont forget to set the "tag" value and set the "delegate" to self! The just add this "dropdownview" to the current view you are in ( [self.view addSubview:dropDownView.view];) and then call open animation to make the table appear!
        
        NSString *tag = @"distance";
        
        dropDownView = [[DropDownView alloc] initWithArrayData:self.thirdData tag:tag cellHeight:30 heightTableView:height widthTableView:width paddingTop:0 paddingLeft:0 paddingRight:0 refView:myRect];
        
        dropDownView.delegate = self;
        [self.view addSubview:dropDownView.view];
        [dropDownView openAnimation];
        
7. Implement the delegate method to get the String information that the User clicked on. You can use the "tag" you set earlier to determine which textfield/view etc was selected. Then remember to close the dropdownview in this method:

![Preview](https://github.com/kyramckenna/ScreenShots/blob/master/delegatemethod.png)

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

Then you can add these size values when creating the DropDownTable using the initWithArrayData method:

        dropDownView = [[DropDownView alloc] initWithArrayData:self.thirdData tag:tag cellHeight:30 heightTableView:height widthTableView:width paddingTop:0 paddingLeft:0 paddingRight:0 refView:myRect];
        
        dropDownView.delegate = self;
        
License
Free to use :)
