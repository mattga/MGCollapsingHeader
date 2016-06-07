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
	attrs = @[[MGTransformAttribute attribute:MGAttributeX value:self.button4.frame.origin.x - r],
			  [MGTransformAttribute attribute:MGAttributeY value:self.button4.frame.origin.y - r],
			  [MGTransformAttribute attribute:MGAttributeWidth value:2*r],
			  [MGTransformAttribute attribute:MGAttributeHeight value:2*r],
			  [MGTransformAttribute attribute:MGAttributeCornerRadius value:r],
			  [MGTransformAttribute attribute:MGAttributeFontSize value:15.]];
	[self.headerView addTransformingSubview:self.button4 attributes:attrs];
	
	attrs = @[[MGTransformAttribute attribute:MGAttributeX value:520.],
			  [MGTransformAttribute attribute:MGAttributeY value:20.],
			  [MGTransformAttribute attribute:MGAttributeWidth value:40.],
			  [MGTransformAttribute attribute:MGAttributeHeight value:35.]];
	[self.headerView addTransformingSubview:self.button5 attributes:attrs];
	
	attrs = @[[MGTransformAttribute attribute:MGAttributeY value:20.],
			  [MGTransformAttribute attribute:MGAttributeWidth value:120.],
			  [MGTransformAttribute attribute:MGAttributeHeight value:34.],
			  [MGTransformAttribute attribute:MGAttributeCornerRadius value:17.],
			  [MGTransformAttribute attribute:MGAttributeFontSize value:25.]];
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
