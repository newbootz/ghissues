# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
  Bones.setup
rescue LoadError
  begin
    load 'tasks/setup.rb'
  rescue LoadError
    raise RuntimeError, '### please install the "bones" gem ###'
  end
end

ensure_in_path 'lib'
require 'ghissues'

task :default => 'spec:run'

PROJ.name = 'ghissues'
PROJ.authors = 'James Britt'
PROJ.email = 'james@neurogami.com'
PROJ.url = 'http://neurogami.com/code'
PROJ.version = Ghissues::VERSION
PROJ.readme_file = 'README.markdown'
PROJ.summary = 'CLI tool for GitHub "Issues" API'

PROJ.rubyforge.name = 'ghissues'  # There is no RF project

PROJ.spec.opts << '--color'


# EOF
