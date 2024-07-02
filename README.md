here's some garbage

---

 # nvim post clone steps

You'll probably need to run `:SpellfileRegen`, as the `.spl` file is ignored,
words added to the dictionary will be ignored without it.

Ensure you have a c compiler installed to build the  fzf-native telescope
extension, this will fail gracefully if you don't, but telescope won't be as
fast as it'll fallback to lua implementation.

Things should be automatically grabbed by mason and lazy, run `:checkhealth` to
see if anything critical is missing

Unity debugging is a pain in the ass and probably won't work, but any chance of
it working will require the vscode unity plugin, which means you'll have to
install vscode (the Microsoft version, as its not accessible in the open source
version).

# game saves

You'll need to create symlinks from the game saves in onedrive to their appropriate
locations on disk, see save_locations.md in 'Game Saves'
