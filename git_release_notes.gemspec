$:.push File.expand_path("../lib", __FILE__)

require "git_release_notes/version"

Gem::Specification.new do |s|
  s.name        = 'git_release_notes'
  s.version     = GitReleaseNotes::VERSION
  s.licenses    = ['MIT']

  ## Edit these as appropriate
  s.summary     = "Jira Issues"
  s.description   = %q{Building Release Notes from JIRA based on Git commits.}

  s.authors       = ["Filip Jakubowski-Drzrwiecki"]
  s.email         = ["don.o.phelippe@gmail.com"]
  s.homepage      = 'https://github.com/filipjakubowski'
  s.metadata      = { "source_code_uri" => "https://github.com/filipjakubowski/git_release_notes" }

  s.files          = %w{lib/git_release_notes.rb lib/git_release_notes/jira_adapter.rb lib/git_release_notes/jira_release_notes.rb lib/git_release_notes/git_adapter.rb lib/git_release_notes/version.rb}

  s.require_paths = %w[lib]

  s.add_dependency 'jira-ruby', '~>2.2.0'
  s.add_dependency 'git', '~>1.12'

  ## List your development dependencies here. Development dependencies are
  ## those that are only needed during development
  s.add_development_dependency "rake", '~>13.6'
  s.add_development_dependency "rspec", '~>3.12'

  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end