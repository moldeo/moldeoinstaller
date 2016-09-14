rem git pull --recurse-submodules
rem git submodule update --recursive
git submodule init
git submodule foreach git checkout master
git submodule foreach git pull
pause
