# -*- encoding: utf-8 -*-
require File.expand_path('../lib/version.rb', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'sugarcube'
  gem.version       = SugarCube::Version
  gem.licenses      = ['MIT']

  gem.authors = ['Colin T.A. Gray', 'Katsuyoshi Ito', 'Thom Parkin', 'Michael Erasmus', 'Mark Rickert']
  gem.email   = ['colin@hipbyte.com', 'mjar81@gmail.com']
  gem.summary     = %{Extensions for Ruby to make Rubymotion development more enjoyable, and hopefully more rubyesque!}
  gem.description = <<-DESC
== Description

CocoaTouch/iOS is a *verbose* framework.  These extensions hope to make
development in rubymotion more enjoyable by tacking "UI" methods onto the
base classes (String, Fixnum, Float).  With sugarcube, you can create a
color from an integer or symbol, or create a UIFont or UIImage from a
string.

Some UI classes are opened up as well, like adding the `<<`` operator to a
`UIView` instance, instead of `view.addSubview(subview)`, you can use the more
idiomatic: `view << subview`.
DESC

  gem.homepage    = 'https://github.com/rubymotion/sugarcube'

  gem.files       = Dir.glob('lib/**/*.rb')
  gem.files      << 'README.md'
  gem.test_files  = Dir.glob('spec/**/*.rb')

  gem.require_paths = ['lib']
end
