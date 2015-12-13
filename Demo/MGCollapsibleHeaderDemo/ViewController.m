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
	
	self.titleLabel.clipsToBounds = YES;
	self.titleLabel.layer.cornerRadius = self.titleLabel.frame.size.height / 2.;
	
	[self.headerView setBodyViewTop:self.tableViewTop];
	[self.headerView addFadingSubview:self.button1 fadeBy:.4];
	[self.headerView addFadingSubview:self.button2 fadeBy:.4];
	[self.headerView addFadingSubview:self.button3 fadeBy:.4];
	[self.headerView addFadingSubview:self.label fadeBy:.75];
	[self.headerView addTransformingSubview:self.button4
								 attributes:@[[MGTransformAttribute attribute:MGAttributeX value:520.],
											  [MGTransformAttribute attribute:MGAttributeY value:20.],
											  [MGTransformAttribute attribute:MGAttributeWidth value:40.],
											  [MGTransformAttribute attribute:MGAttributeHeight value:35.]]];
	[self.headerView addTransformingSubview:self.titleLabel
								 attributes:@[[MGTransformAttribute attribute:MGAttributeY value:20.],
											  [MGTransformAttribute attribute:MGAttributeWidth value:120.],
											  [MGTransformAttribute attribute:MGAttributeHeight value:34.],
											  [MGTransformAttribute attribute:MGAttributeCornerRadius value:17.]]];
}

#pragma mark - Tableview data source

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

#pragma mark - Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	[self.headerView collapseToOffset:scrollView.contentOffset];
}

@end
