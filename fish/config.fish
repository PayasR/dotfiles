# No stupid emacs bindings
fish_vi_key_bindings

# Set the aliases
abbr vim="nvim"
abbr vi="nvim"

# Environment variables
set fish_user_paths /usr/lib64/qt-3.3/bin /home/praja002/perl5/bin /home/praja002/.cargo/bin 
set fish_user_paths $fish_user_paths /home/praja002/Projects/go/bin /usr/local/bin /usr/bin /usr/sbin
set fish_user_paths $fish_user_paths /home/praja002/.local/bin /home/praja002/.fzf/bin

abbr -a yr 'cal -y'
abbr -a c cargo
abbr -a e nvim
abbr -a m make
abbr -a o xdg-open
abbr -a g git
abbr -a gc 'git checkout'
abbr -a ga 'git add -p'
abbr -a vimdiff 'nvim -d'

if command -v exa > /dev/null
	abbr -a l 'exa'
	abbr -a ls 'exa'
	abbr -a ll 'exa -l'
	abbr -a lll 'exa -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end

# Startup
if status --is-interactive
	tmux ^ /dev/null; and exec true
end

function fish_greeting
	echo
	echo -e (uname -ro | awk '{print " \\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uptime -p | sed 's/^up //' | awk '{print " \\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uname -n | awk '{print " \\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')

	set_color normal
end

set LD_LIBRARY_PATH $LD_LIBRARY_PATH /home/praja002/gcc-8.1.0/lib64/ /usr/local/lib/ /usr/local/lib64/
