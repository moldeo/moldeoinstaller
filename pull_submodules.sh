#git pull --recurse-submodules
#git submodule update --recursive
git submodule foreach git checkout master
git submodule foreach git pull

