#!/bin/bash
# Simple script to start a tmux session.
# 
# Functionality: Checks whether a tmux session is present.
# If not, it creates one for you with the options provided.
# 
# Example usage:
#   ./stm.sh    # single window with two panes, one for editing code, one for execution.
#   ./stm.sh -j # two windows, the second one for a jupyter notebook.
#   ./stm.sh -m # two windows, the second one for monitoring with htop.
#   ./stm.sh -n # two windows, the second one for monitoring with htop and nvidia-smi


CENV='python3'

tmux has-session -t DEV 2>/dev/null
if [ "$?" -eq 1 ] ; then
    # No session found
    echo "Starting tmux session $@"
    i=1
    tmux new-session -s DEV -n DEV -d
    tmux send-keys -t DEV:0 "source activate ${CENV}; clear" C-m
    tmux split-window -v -p 30 -t DEV:0
    tmux send-keys -t DEV:0.1 "source activate ${CENV}; clear" C-m

    for ARG in "$@"; do
        case $ARG in 
        "-j" )
            tmux new-window -n JUPYTER -t DEV:$i
            tmux send-keys -t DEV:$i "source activate ${CENV}; jupyter notebook" C-m
            ;;
        "-m" )
            tmux new-window -n MONITOR -t DEV:$i
            tmux send-keys -t DEV:$i 'htop' C-m
            ;;
        "-n" )
            tmux new-window -n MONITOR -t DEV:$i
            tmux send-keys -t DEV:$i 'watch -n0.5 nvidia-smi' C-m
            tmux split-window -v -p 60 -t DEV:$i
            tmux send-keys -t DEV:${i}.1 'htop' C-m
            ;;
        *) echo "The option $i is not supported"
        esac
        let i=$i+1
    done
fi
tmux attach -t DEV:0
