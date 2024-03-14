
# Check if the current directory is the home directory
if [ "$PWD" != "$HOME" ]; then
  echo "#"
  echo "# WARNING! The program should be run from your HOME directory!"
  echo "#"
fi


# Make the bin directory.
mkdir -p ~/bin

echo "# 1. Installing mamba"
echo "#"

# Installing mamba
wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh";
bash Miniforge3-$(uname)-$(uname -m).sh -b;
source source "${HOME}/miniforge/etc/profile.d/conda.sh"
# For mamba support also run the following command
source "${HOME}/miniforge/etc/profile.d/mamba.sh"
mamba init;
source "${HOME}/.bashrc";
mamba activate;

