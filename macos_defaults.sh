# always show hidden files
defaults write com.apple.finder AppleShowAllFiles true

# disable the press and hold for accent letters
defaults write -g ApplePressAndHoldEnabled -bool false

# disable window opening animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# displays have separates spaces off, macos behaves more reliably
# and works better with aerospace
defaults write com.apple.spaces spans-displays -bool true

# mission control plays nicer with aerospace with windows are grouped
defaults write com.apple.dock expose-group-apps -bool true
