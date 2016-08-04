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
4. Create a method to catch events for Textfields and TextAreas eg: -(void)textViewDidBeginEditing:(UITextView *)textView
5. Inside this event, initialise the dropdown table. This is where you specify the contents and dimensions of your popup/dropdown table

dropDownView = [[DropDownView alloc] initWithArrayData:self.firstData tag:tag cellHeight:30 heightTableView:height widthTableView:width paddingTop:-8 paddingLeft:-5 paddingRight:-10 refView:myRect];
