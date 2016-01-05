$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |spec|
  spec.name           = 'poulloubus'
  spec.version        = '0.0.1'
  spec.date           = '2016-01-05'
  spec.summary        = 'Bus management'
  spec.description    = 'Bus management with messages and events'
  spec.authors        = ['Poullou']
  spec.email          = 'poullou.dev@gmail.com'
  spec.files          = `git ls-files`.split("\n")
  spec.test_files     = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths  = ['lib']
  spec.homepage       = 'https://github.com/Poullou/poulloubus'
  spec.license        = 'MIT'
end
