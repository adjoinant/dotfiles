#!/usr/bin/env ruby

# what are we installing

TAPS = [
  'homebrew/games',
  'caskroom/fonts'
]

BREWS = [
  'git',
  'heroku-toolbelt',
  'leiningen',
  'mongodb',
  'node',
  'pass',
  'redis'
]

CASKS = [
  'alfred',
  'atom',
  'bitcoin-core',
  'evernote',
  'firefox',
  'flux',
  'google-chrome',
  'google-drive',
  'gpgtools',
  'iterm2',
  'java',
  'monotype-skyfonts',
  'nomachine',
  'pg-commander',
  'pgadmin3',
  'skype',
  'slack',
  'sourcetree',
  'the-unarchiver',
  'vagrant',
  'virtualbox',
  'vlc',

  # fonts
  'font-fredoka-one',
  'font-lato',
  'font-open-sans',
  'font-source-code-pro',

  # quicklook plugins
  'qlcolorcode',
  'qlmarkdown',
  'qlstephen',
  'quicklook-csv',
  'quicklook-json',
  'webpquicklook',

]

GEMS = [
  'genghisapp'
]



# do the installation

if `which brew` == ''
  puts `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
end

INSTALLED_BREWS = `brew list`.split("\n")
INSTALLED_CASKS = `brew cask list`.split("\n")
INSTALLED_GEMS = `gem list --no-versions`.split("\n")
INSTALLED_TAPS = `brew tap`.split("\n")

$command_queue = ['brew update']
unless INSTALLED_BREWS.include? 'brew-cask'
  $command_queue.push "brew install caskroom/cask/brew-cask"
end

def install(list, command, existing)
  list.each do |package|
    name = package.split.first
    unless existing.include? name
      print "install #{name}? "
      skip_cmd = gets.strip
      go_ahead = (skip_cmd == 'y') || (skip_cmd == 'yes') || (skip_cmd == '')
      $command_queue.push "#{command} #{package}" if go_ahead
    end
  end
end

install TAPS, "brew tap", INSTALLED_TAPS
install BREWS, "brew install", INSTALLED_BREWS
install CASKS, "brew cask install", INSTALLED_CASKS
install GEMS, "gem install", INSTALLED_GEMS

$command_queue.each do |command|
  system command
end
