# Install some tools that I like to have around.
PACKAGES='curl wget vim'
for p in $PACKAGES; do
	dpkg -s $p > /dev/null
	if [[ $? != 0 ]]; then
		sudo apt-get install -y $p
	fi
done

# Remove the side bar - I don't really use it.
# TODO: When I'm installing things, I should check to see if they're already
# installed (or not installed, as the case may be). 
DOCK_PACKAGE='gnome-shell-extension-ubuntu-dock'
dpkg -s ${DOCK_PACKAGE} 
if [[ $? == 0 ]]; then 
	sudo apt-get remove gnome-shell-extension-ubuntu-dock
fi

# TODO: Install a nice font.
# I downloaded cozette (it's a simple bitmap font available as a submodule in
# this repository), but you need to tweak Ubuntu to allow bitmap fonts. 
BITMAPS_DISABLED_FILE='/etc/fonts/conf.d/70-no-bitmaps.conf'
BITMAPS_ENABLED_FILE='/etc/fonts/conf.d/70-yes-bitmaps.conf'
if [[ -L ${BITMAPS_ENABLED_FILE} ]]; then
	echo "It looks like bitmap fonts are already enabled on this system."
elif [[ -e /etc/fonts/conf.d/70-no-bitmaps.conf ]]; then
	echo "It looks like bitmap fonts are disabled on this system."
	echo "I'll handle that real quick."
	sudo rm ${BITMAPS_DISABLED_FILE}
	sudo ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf ${BITMAPS_ENABLED_FILE}
fi

# I don't think cozette is great in the terminal - the settings I had made it
# all squished. TODO: Play around with it a bit. 

# TODO: Adjust the color settings for the terminal.
# I generally like matte colors without too much contrast. 

# TODO: Disable the scrollbar for the terminal. It's sort of a visual 
# distraction. 

# TODO: Adjust the color settings for vim.
# TODO: Install a nice IDE.
# I don't have a strong opinion on IDEs, but maybe there's something simple 
# that works well with vim. 


# TODO: Install GNOME Shell Integration, so we can hide the top bar. 
GNOME_SHELL_PACKAGE='chrome-gnome-shell'
dpkg -s ${GNOME_SHELL_PACKAGE} > /dev/null
if [[ $? != 0 ]]; then
	sudo apt-get install chrome-gnome-shell
fi

# Then, you can install it from here:
# https://extensions.gnome.org/extension/545/hide-top-bar/

# Other extensions I like, to make things simpler:
# https://extensions.gnome.org/extension/1128/hide-activities-button/
# https://extensions.gnome.org/extension/1267/no-title-bar/

# Set a nice background. 
# I'd really like a background that meshes with the colors that I've chosen.
# Maybe I'll put some more time into finding that, some day. 
if [[ ! -e ~/Pictures/nice_background.png ]]; then
	curl -o ~/Pictures/nice_background.png https://i.imgur.com/sRpDOp3.jpg
fi

# TODO: Aren't there some things that make the internet less noisy? Like, 
# ad blockers, that sort of thing. https://xkcd.com/2112
# That sounds like it'd be a nice thing to have as well, although this is 
# already getting pretty complicated. 

# TODO: Install a nice theme for the web browsers. I usually like dark themes.
# TODO: Change the home page to the web browsers to a blank page, so it's simpler.
