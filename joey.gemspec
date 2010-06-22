# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{joey}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Waseem Ahmad"]
  s.date = %q{2010-06-22}
  s.description = %q{Object wrappers for nodes in the Facebook OpenGraph}
  s.email = %q{talk.to.waseem@gmail.com}
  s.extra_rdoc_files = ["README.md", "lib/joey.rb", "lib/joey/affiliation.rb", "lib/joey/album.rb", "lib/joey/education.rb", "lib/joey/education_history.rb", "lib/joey/fetching_array.rb", "lib/joey/hs_info.rb", "lib/joey/location.rb", "lib/joey/model.rb", "lib/joey/page.rb", "lib/joey/parser_helpers.rb", "lib/joey/photo.rb", "lib/joey/profile.rb", "lib/joey/relative.rb", "lib/joey/rest_api.rb", "lib/joey/status.rb", "lib/joey/television.rb", "lib/joey/user.rb", "lib/joey/version.rb", "lib/joey/work.rb", "lib/joey/work_history.rb"]
  s.files = ["COPYING.txt", "README.md", "Rakefile", "devel.vim", "init.rb", "joey.gemspec", "lib/joey.rb", "lib/joey/affiliation.rb", "lib/joey/album.rb", "lib/joey/education.rb", "lib/joey/education_history.rb", "lib/joey/fetching_array.rb", "lib/joey/hs_info.rb", "lib/joey/location.rb", "lib/joey/model.rb", "lib/joey/page.rb", "lib/joey/parser_helpers.rb", "lib/joey/photo.rb", "lib/joey/profile.rb", "lib/joey/relative.rb", "lib/joey/rest_api.rb", "lib/joey/status.rb", "lib/joey/television.rb", "lib/joey/user.rb", "lib/joey/version.rb", "lib/joey/work.rb", "lib/joey/work_history.rb", "Manifest"]
  s.homepage = %q{http://github.com/waseem/joey}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Joey", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{joey}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Object wrappers for nodes in the Facebook OpenGraph}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
