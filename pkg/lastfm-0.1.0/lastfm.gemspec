# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lastfm}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Panagiotis Papadopoulos (PanosJee)"]
  s.date = %q{2009-12-08}
  s.description = %q{A Ruby client for LastFm that feels like Ruby.}
  s.email = %q{panosjee@gmail.com}
  s.extra_rdoc_files = ["README.textile", "lib/last_fm.rb", "lib/last_fm/models/album.rb", "lib/last_fm/models/artist.rb", "lib/last_fm/models/base.rb", "lib/last_fm/models/chart.rb", "lib/last_fm/models/event.rb", "lib/last_fm/models/tag.rb", "lib/last_fm/models/track.rb", "lib/last_fm/models/user.rb"]
  s.files = ["MIT-LICENSE", "Manifest", "README.textile", "Rakefile", "lib/last_fm.rb", "lib/last_fm/models/album.rb", "lib/last_fm/models/artist.rb", "lib/last_fm/models/base.rb", "lib/last_fm/models/chart.rb", "lib/last_fm/models/event.rb", "lib/last_fm/models/tag.rb", "lib/last_fm/models/track.rb", "lib/last_fm/models/user.rb", "lastfm.gemspec"]
  s.homepage = %q{http://github.com/PanosJee/LastFm}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Lastfm", "--main", "README.textile"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{lastfm}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A Ruby client for LastFm that feels like Ruby.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
