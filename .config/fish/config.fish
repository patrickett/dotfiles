#system
alias update='sudo pacman -Syu'
alias install="sudo pacman -S"
alias ll="exa -la"
alias l="exa -1"
alias ls="exa -1"
alias lt="exa --tree"
alias uninstall="sudo pacman -R"
alias purge="sudo pacman -Rs"
alias e="exit"
alias cls=clear

#programs
alias n="nano"
alias music="ncmpcpp"
alias monitor="sudo airmon-ng start"
alias py2=python2
alias py3=python3
alias search="sudo find -mindepth 0 -maxdepth 10000 -name "

#program commands
alias gc="git clone"
alias kpoly="killall -q polybar"
alias nettraffic="/home/netrunner/.config/polybar/./nettraffic"
alias ipconfig="ip a"
alias scrape="youtube-dl"
alias aur="sh ~/git-dev/scripts/bash/aurinstall"
alias ranger="ranger-cd"


#directories
alias des="cd Desktop ; ls -1"
alias down="cd Downloads ; ls -1"
alias con="cd .config ; ls -1"  
alias doc="cd Documents; ls -1"
alias pyp="cd Development/PythonProjects/ ; ls -1"
alias cppp="cd Development/C++Projects/; ls -1"


function ranger-cd                                                               

  set tempfile '/tmp/chosendir'                                                  
  /usr/bin/ranger --choosedir=$tempfile (pwd)                                    

  if test -f $tempfile                                                           
      if [ (cat $tempfile) != (pwd) ]                                            
        cd (cat $tempfile)                                                       
      end                                                                        
  end                                                                            

  rm -f $tempfile                                                                

end                                                                              

function fish_user_key_bindings                                                  
    bind \co 'ranger-cd ; fish_prompt'                                           
end

bind \cr 'ranger; clear; exa -1; commandline -f repaint'
