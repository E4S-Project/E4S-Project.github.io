source "https://rubygems.org"

# Use the latest stable Jekyll 4.3 series.
gem "jekyll", "~> 4.3"

# Required for using Minimal Mistakes via `remote_theme`
gem "jekyll-remote-theme", "~> 0.4.3"

group :jekyll_plugins do
  gem "jekyll-feed"
  gem "jekyll-sitemap"
  gem "jekyll-include-cache"
  gem "jekyll-redirect-from"
end

# Windows and JRuby platform dependencies (safe to include)
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance booster for watching directories on Windows
gem "wdm", "~> 0.1", platforms: [:mingw, :x64_mingw, :mswin]

# JRuby-specific dependency
gem "http_parser.rb", "~> 0.6.0", platforms: [:jruby]
