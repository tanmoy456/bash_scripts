#~~~~~ general aliases ~~~~
alias ..='cd ..'
alias ...='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'
alias lsh='ls -lh'
alias folder='nautilus .'
alias dush='du -sh * | sort -h'   # folder sizes
alias storage='df -B1 -h --total' # storage on that system

 #~~~~~ python miniconda3 aliases ~~~~
 alias conda='/home/tanmoy/miniconda3/bin/conda'
 alias python='/home/tanmoy/miniconda3/bin/python3'
 alias jl='/home/tanmoy/miniconda3/bin/jupyter-lab'
 alias jn='/home/tanmoy/miniconda3/bin/jupyter-notebook'
 alias ipython='/home/tanmoy/miniconda3/bin/ipython3'
 alias convert='/home/tanmoy/miniconda3/bin/jupyter-nbconvert'

# ---- PBS Queueing System -----
alias jobs='qstat -n1'
alias myjobs='qstat -u tanmoy'
alias nodesfree="pbsnodes -a | grep "free" | wc -l"  # shows how many nodes are free
alias freenodes='pbsnodes -a | awk '\''/Mom =/ {mom=$3} /state = free/ {print "NODE =", mom; getline; ncpus=$3;  print "   state = free"; getline; print "   ncpus =", nc
pus}'\'''  # shows which nodes are free





