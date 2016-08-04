//
//  DropDownView.h
//  Lareb
//
//  Created by Kyra McKenna on 20/08/2015.
//  Copyright (c) 2015 Epidemico, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DropDownViewDelegate

-(void)dropDownCellSelected:(NSString*)tagName itemChosen:(NSString*)item;

@end

@interface DropDownView : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) id<DropDownViewDelegate> delegate;
@property (nonatomic,retain)UITableView *uiTableView;
@property (nonatomic,retain) NSArray *arrayData;
@property (nonatomic) CGFloat heightOfCell;
@property (nonatomic) CGFloat paddingLeft;
@property (nonatomic) CGFloat paddingRight;
@property (nonatomic) CGFloat paddingTop;
@property (nonatomic) CGFloat heightTableView;
@property (nonatomic) CGFloat widthTableView;
@property (nonatomic) CGRect refView;
@property (nonatomic) CGFloat open;
@property (nonatomic) CGFloat close;
@property (nonatomic) NSInteger animationType;
@property (nonatomic) NSString* tagName;

- (id)initWithArrayData:(NSArray*)data tag:(NSString*)tag cellHeight:(CGFloat)cHeight heightTableView:(CGFloat)tHeightTableView widthTableView:(CGFloat)widthTableView paddingTop:(CGFloat)tPaddingTop paddingLeft:(CGFloat)tPaddingLeft paddingRight:(CGFloat)tPaddingRight refView:(CGRect)rView;

-(void)closeAnimation;

-(void)openAnimation;

@end
