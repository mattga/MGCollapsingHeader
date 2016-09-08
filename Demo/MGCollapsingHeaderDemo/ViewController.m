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

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.headerView setDelegate:self];
    [self.headerView setCollapsingConstraint:_headerHeight];

    // Setting alwaysCollapse to NO will cause the header to collapse only if there is
    // enough room to scroll in the scroll view. Otherwise, scrolling through any content
    // size (even if empty) will collapse the header with a content inset (default).
    //
    //    [self.headerView setAlwaysCollapse:NO];

    // Multiple vertical contraints can be added to collapse. Note that the transformation
    // values will differ depending on how the header view is congifured to collapse.
    //
    //    [self.headerView setCollapsingConstraint:_headerTop];
    //    [self.headerView setCollapsingConstraint:_tableViewTop];

    [self.headerView addFadingSubview:self.button1 fadeBy:0.3];
    [self.headerView addFadingSubview:self.button2 fadeBy:0.3];
    [self.headerView addFadingSubview:self.button3 fadeBy:0.3];

    NSArray *attrs;
    double r = 16.0;
    attrs    = @[
        [MGTransform transformAttribute:MGAttributeX byValue:-r],
        [MGTransform transformAttribute:MGAttributeY byValue:-r],
        [MGTransform transformAttribute:MGAttributeWidth byValue:2 * r],
        [MGTransform transformAttribute:MGAttributeHeight byValue:2 * r],
        [MGTransform transformAttribute:MGAttributeCornerRadius byValue:r],
        [MGTransform transformAttribute:MGAttributeFontSize byValue:12.0]
    ];
    [self.headerView addTransformingSubview:self.button4 attributes:attrs];

    // Push this button closer to the bottom-right corner since the header view's height
    // is resizing.
    attrs = @[
        [MGTransform transformAttribute:MGAttributeX byValue:10.0],
        [MGTransform transformAttribute:MGAttributeY byValue:13.0],
        [MGTransform transformAttribute:MGAttributeWidth byValue:-32.0],
        [MGTransform transformAttribute:MGAttributeHeight byValue:-32.0]
    ];
    [self.headerView addTransformingSubview:self.button5 attributes:attrs];

    attrs = @[
        [MGTransform transformAttribute:MGAttributeY byValue:-30.0],
        [MGTransform transformAttribute:MGAttributeWidth byValue:-30.0],
        [MGTransform transformAttribute:MGAttributeHeight byValue:-20.0],
        [MGTransform transformAttribute:MGAttributeFontSize byValue:-10.]
    ];
    [self.headerView addTransformingSubview:self.label attributes:attrs];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark -
#pragma mark Tableview data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 14;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text   = [NSString stringWithFormat:@"CONTENT %d", (int)indexPath.row];

    return cell;
}

#pragma mark -
#pragma mark Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.headerView collapseWithScroll:scrollView];

    NSLog(@"V:|-(%.2f)-header(%.2f)-(%.2f)-|",
          _headerTop.constant,
          _headerHeight.constant,
          _tableViewTop.constant);
}

#pragma mark -
#pragma mark Collapsing Header Delegate

- (void)headerDidCollapseToOffset:(double)offset
{
    NSLog(@"collapse %.4f", offset);
}
- (void)headerDidFinishCollapsing
{
    NSLog(@"collapsed!!!");
}
- (void)headerDidExpandToOffset:(double)offset
{
    NSLog(@"expand %.4f", offset);
}
- (void)headerDidFinishExpanding
{
    NSLog(@"expanded!!!");
}
@end
