rem git pull --recurse-submodules
rem git submodule update --recursive
git submodule update --init
git submodule foreach git checkout master
git submodule foreach git pull
pause
