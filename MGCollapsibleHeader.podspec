@version = "1.0.2"

Pod::Spec.new do |s|

  s.name         = "MGCollapsibleHeader"
  s.version      = @version
  s.summary      = "A short description of MGCollapsibleHeader."


  s.summary      = "An iOS UIView subclass to manage collapsing and expanding of a header view."
  s.description  = <<-DESC
  Subviews of the header are configured to transform to any collapsed layout. Intended to work with UIScrollView and UITableView as the user scrolls through content, but by all means can be used in other ways.
                   DESC

  s.homepage     = "https://github.com/mattga/MGCollapsibleHeader"
  s.screenshots  = "https://raw.githubusercontent.com/mattga/MGCollapsibleHeader/master/Screenshots/mgcollapsibleheader_demo.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Matthew Gardner" => "matthew@mgardner.me" }
  s.platform     = :ios

  s.source       = { :git => "https://github.com/mattga/MGCollapsibleHeader.git", :tag => "v#{s.version}" }

  s.header_mappings_dir = "MGCollapsibleHeader"
  s.source_files  = "MGCollapsibleHeader/**/*.{h,m}"

end
