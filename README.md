# This is a place to collect the useful material for my Computational Biology course

## !!! This project is now maintained in the [new home of the Lab](https://github.com/QmLHS): [QmLHS/CBCourse](https://github.com/QmLHS/CBCourse) !!!

## Environments: Choose the right room to accomplish a task

More often than not, to accomplish a task you need several tools (i.e. software), and according to the task itself, you
need specific tools.

Solving different tasks will lead you to continuously add new software that increase the probability of software
conflicts.

Creating an environment for each task (or small group of heterogeneous tasks) will help to avoid software conflicts.

`conda` is the tool to easily manage environments.


### Installing mamba

First of all you need to install the package manager. I suggest to use [miniforge](https://github.com/conda-forge/miniforge).

* `wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" bash Miniforge3-$(uname)-$(uname -m).sh`
* `miniforge3/bin/mamba init`

As an alternative you can use the installer tailored for the Virtual Machines \@UniMiB:

`wget https://raw.githubusercontent.com/qLSLab/CBCourse/main/VMconfigs/installMyMamba.sh`

and then execute it from the home


### Creating an environment

To create a new environment is simple as this:

`mamba create -n MyEnvironmentName`

then you need to activate it

`mamba activate MyEnvironmentName`

and populate it with the available software of your choice

`mamba install python=3.11 pandas matplotlib`

With the line above, you will install python (version 3.11), its two libraries matplotlib and pandas, with all the
necessary programs (dependencies).

From now on, whenever you need to use python together with pandas or matplotlib, it is enough to activate de environment
and use them.

Remember that the programs installed within an environment are available only within that environment.


### Using an environment

To "enter" an environment you need to explicitly activate it:

`mamba activate environmentName`

Once finished, you can "exit" the environment by deactivating it:

`mamba deactivate`

To obtain the list of all the available environments, digit

`mamba info --envs`



### Sharing an environment

It is possible to save a snapshot of an environment in order to share it, or to port it on another computer.

```bash
mamba activate MyEnvironmentName
mamba env export > environment.yml
```

then, you can create an exact copy of it running

```bash
conda env create -f environment.yml
```

or

```bash
mamba env update -n <your-env> --file environment.yml
```

### Removing an environment

To completely remove an environment from your computer, digit

`mamba env remove --name MyEnvironmentName`



### Conda channels

A conda/mamba channel is a compilation of packages. Some of them are thematics such as `bioconda` or tries to have the most up to date
cross platform version of the packages `conda-forge`

To add a channel to an environment run

```bash
mamba config --append channels conda-forge
```


### Example:

Create an environment to perform exploratory data analyses with python.
Let's say we need python (3.11), ipython (to ease the use of python), pandas (to mangle the data), openpyxl (to write *.xlsx) and matplotlib to visualize the information.

```bash
mamba create -n dataAn python=3.11
mamba activate dataAn
mamba install ipython pandas openpyxl matplotlib
```

or from the file `condaEnvDataAnalysisMinimal.yml`

`conda create -f condaEnvDataAnalysisMinimal.yml`


### mamba and poetry

1. If not already done, install miniforge or micromamba:
    * `wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" bash Miniforge3-$(uname)-$(uname -m).sh`
    * `miniforge3/bin/mamba init`
2. Create a new specific environment for your project:

    `mamba create -n myNewProjectEnv python=3.XX poetry="1.*"`
3. activate it:
    `mamba activate myNewProjectEnv`
4. create a new project `poetry new myNewProject` or tune the `pyproject.toml`
5. Install all the dependencies
    `poetry install`
6. run your code either from mamba or poetry e.g `poetry run ipython myProgram.py`


### Visual Studio Code tips:

* to render invisible charaters `"editor.renderWhitespace": "all",` (`ctrl,` -> search `whitespace`)
* [Select and activate an environment](https://code.visualstudio.com/docs/python/environments#_select-and-activate-an-environment)
