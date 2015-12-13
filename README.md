# MGCollapsibleHeader
A UIView subclass to manage collapsing and expanding of a header view. Subviews of the header are configured to transform to any collapsed layout. The header is intended to work with a UIScrollView or UITableView as the user scrolls through content, but by all means can be used in other ways.

![Demo Gif](Screenshots/mgcollapsibleheader_demo.gif)

##Installation
###### With [Cocoa Pods](https://cocoapods.org/):
```ruby
pod 'MGCollapsibleHeader'
```

Or simply copy the `MGCollapsibleHeader/` folder into your project.

##How to use
To use the collapsible header, you must first configure your `UIViewController` with a header view. Simply set the Class of this view as `MGCollapsibleHeaderView` and it will be ready to collapse. The view reduces to a size of 60 px by default, but can be set as follows.
```objc
[self.headerView setMinimumHeaderHeight:100.]
```

You can then provide the top `NSLayoutConstraint` of a body view to expand as the header collapses.
```objc
[self.headerView setBodyViewTop:self.tableViewTop]
```

Lastly, trigger the header view to collapse. `scrollViewDidScroll` is the ideal place for this.
```objc
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	[self.headerView collapseToOffset:scrollView.contentOffset];
}
```
