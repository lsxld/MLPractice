
alias bootenv='source $(git rev-parse --show-toplevel)/bootenv.sh'

export STEM=$(git rev-parse --show-toplevel)

alias go='cd $(git rev-parse --show-toplevel)'

export PATH="$STEM/gitwrapper:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

git config alias.submit '!gitsubmit'
git config alias.sync '!gitsync'
git config alias.filelog 'log --oneline --'
git config alias.diff2 '!gitdiff2'
git config alias.opened 'status -s'
git config alias.changes 'log --oneline'
git config alias.tkdiff '!gitdiff'
git config alias.checkupdate '!git fetch -q && git log origin --not HEAD --'

alias rundocker="nvidia-docker run -p 8888:8888 -v $STEM/notebooks:/notebooks -it tensorflow/tensorflow:latest-gpu $*"

export CUDA_HOME="/usr/local/cuda-9.0"
export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$CUDA_HOME/extras/CUPTI/lib64:$LD_LIBRARY_PATH"
