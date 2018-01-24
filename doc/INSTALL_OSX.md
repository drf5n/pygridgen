# Setting up a  Mac OS X machine for grid generation
(tested on Lion)

## Basics stuff
You probably need XCode and the XCode command line stuff installed.
Get XCode from the Mac App store and setup the command line tools
from within XCode or from the command line itself.

http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/


## Getting miniconda and creating an environment
```
$ wget http://repo.continuum.io/miniconda/Miniconda3-3.7.3-MacOSX-x86_64.sh -O miniconda.sh
$ chmod +x miniconda.sh
$ ./miniconda.sh -b
$ export PATH=/home/grid/miniconda/bin:$PATH  # you'll probably want to do this permanently
$ conda update conda
$ conda create --name=gridgen python=2.7 pip nose matplotlib numpy --yes
$ source activate gridgen
```

### Dealing with projected data:

```
$ conda install -c https://conda.binstar.org/asmeurer pyproj --yes
```

Or for more adavanced map-related plotting:

```
$ conda install basemap --yes
```

## Cloning repos from github

```
$ mkdir sources && cd sources
$ git clone https://github.com/geosyntec/pygridgen.git
```

## Building C/C++ dependencies

`$ cd pygridgen/external`

### nearest neighbors
```
$ cd nn
$ ./configure
$ make clean
$ sudo make install
$ cd ..
```

### CSA
```
$ cd csa
$ ./configure
$ make clean
$ sudo make install
$ cd ..
```

### gridutils
```
$ cd gridutils
$ ./configure
$ make clean
$ sudo make install
$ cd ..
```

### gridgen-C
```
$ cd gridgen
$ ./configure
$ make clean
$ sudo make
$ sudo make lib
$ sudo make shlib
$ sudo make install
$ cd ..
```

## Install pygridgen
```
$ cd ~/sources/pygridgen
$ source activate gridgen
$ python setup.py install
```

# Pure conda-forge install for MacOS 
 (Tested on MacOS Sierra 10.12.6  2018-01-24)

Assuming you already have Anaconda installed, the script below will setup a Python 3 environment named 'pygridgen' and run the example on the front page.

```
conda create pygridgen python=3.6 pygridgen --channel=conda-forge
source activate pygridgen

conda install ipython

# test it out:

ipython
#
import matplotlib.pyplot as plt
import pygridgen
x = [0, 1, 2, 1, 0]
y = [0, 0, 1, 2, 2]
beta = [1, 1, 0, 1, 1]

grid = pygridgen.grid.Gridgen(x, y, beta, shape=(10, 5))

fig, ax = plt.subplots()
ax.plot(x, y, 'k-')
ax.plot(grid.x, grid.y, 'b.')
plt.show()
 ```

This install uses the repository at https://anaconda.org/conda-forge/pygridgen and https://github.com/conda-forge/pygridgen-feedstock
