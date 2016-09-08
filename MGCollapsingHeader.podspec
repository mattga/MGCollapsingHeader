@version = "1.0.6"

Pod::Spec.new do |s|

  s.name         = "MGCollapsingHeader"
  s.version      = @version
  s.summary      = "UIView subclass to manage a collapsing and expanding header view."

  s.description  = <<-DESC
  Subviews of the header are configured to transform to any collapsed layout. The header works with any UIScrollView, and transforms views as the user scrolls through content.
                   DESC

  s.homepage     = "https://github.com/mattga/MGCollapsingHeader"
  s.screenshots  = "https://raw.githubusercontent.com/mattga/MGCollapsingHeader/master/Screenshots/demo-anim.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Matthew Gardner" => "matthew@mgardner.me" }
  s.platform     = :ios

  s.source       = { :git => "https://github.com/mattga/MGCollapsingHeader.git", :tag => "v#{s.version}" }

  s.header_mappings_dir = "MGCollapsingHeader"
  s.source_files  = "MGCollapsingHeader/**/*.{h,m}"

end
