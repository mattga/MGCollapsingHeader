//
//  ViewController.m
//  MGCollapsibleHeaderDemo
//
//  Created by Matthew Gardner on 12/12/15.
//  Copyright © 2015 Matthew Gardner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate>

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

    NSArray *attrs;

    // Push this button closer to the bottom-right corner since the header view's height
    // is resizing.

    attrs = @[
              [MGTransform transformAttribute:MGAttributeAlpha byValue:1.0]
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

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self updateForScrollingEnded];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [self updateForScrollingEnded];
    }
    
    
}

- (void)updateForScrollingEnded {
    if(self.headerView.frame.size.height > 60) { // 60 - min header height
        if(self.headerView.frame.size.height < 155) { // half between full header (240) and collapsed one (60)
            // hide
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
            [self.headerView collapseWithScroll:self.tableView];
        } else {
            // reveal
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
            [self.headerView collapseWithScroll:self.tableView];
        }
    }
}

// selecting row is canceling scroll event
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self updateForScrollingEnded];
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
