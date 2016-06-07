//
//  ViewController.m
//  MGCollapsibleHeaderDemo
//
//  Created by Matthew Gardner on 12/12/15.
//  Copyright © 2015 Matthew Gardner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self.headerView setDelegate:self];
	[self.headerView setBodyViewTop:self.tableViewTop];
	[self.headerView addFadingSubview:self.button1 fadeBy:.3];
	[self.headerView addFadingSubview:self.button2 fadeBy:.3];
	[self.headerView addFadingSubview:self.button3 fadeBy:.3];
	
	NSArray *attrs;
	double r = 18.;
	attrs = @[[MGTransform attribute:MGAttributeX value:self.button4.frame.origin.x - r],
			  [MGTransform attribute:MGAttributeY value:self.button4.frame.origin.y - r],
			  [MGTransform attribute:MGAttributeWidth value:2*r],
			  [MGTransform attribute:MGAttributeHeight value:2*r],
			  [MGTransform attribute:MGAttributeCornerRadius value:r],
			  [MGTransform attribute:MGAttributeFontSize value:15.]];
	[self.headerView addTransformingSubview:self.button4 attributes:attrs];
	
	attrs = @[[MGTransform attribute:MGAttributeX value:520.],
			  [MGTransform attribute:MGAttributeY value:20.],
			  [MGTransform attribute:MGAttributeWidth value:40.],
			  [MGTransform attribute:MGAttributeHeight value:35.]];
	[self.headerView addTransformingSubview:self.button5 attributes:attrs];
	
	attrs = @[[MGTransform attribute:MGAttributeY value:20.],
			  [MGTransform attribute:MGAttributeWidth value:120.],
			  [MGTransform attribute:MGAttributeHeight value:34.],
			  [MGTransform attribute:MGAttributeCornerRadius value:17.],
			  [MGTransform attribute:MGAttributeFontSize value:25.]];
	[self.headerView addTransformingSubview:self.label attributes:attrs];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
	return UIStatusBarStyleLightContent;
}

#pragma mark -
#pragma mark Tableview data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
	cell.textLabel.text = [NSString stringWithFormat:@"CONTENT %d", (int)indexPath.row];
	
	return cell;
}

#pragma mark -
#pragma mark Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	[self.headerView collapseToOffset:scrollView.contentOffset];
}

#pragma mark -
#pragma mark Collapsing Header Delegate

- (void)headerDidCollapseToOffset:(double)offset {
	NSLog(@"collapse %.4f", offset);
}

- (void)headerDidFinishCollapsing {
	NSLog(@"collapsed!!!");
}

- (void)headerDidExpandToOffset:(double)offset {
	NSLog(@"expand %.4f", offset);
}

- (void)headerDidFinishExpanding {
	NSLog(@"expanded!!!");
}

@end
