#! /bin/bash

# PLEASE FILL THE FOLLOWING INFORMATIONS

# CUDA version to be installed
CUDA_VERSION="11.8"
# cudNN version to be installed
CUDNN_VERSION="8.7.0.84"


# Use this flag to reboot the system and continue running from the same point
REBOOT_FLAG="/home/augustoperboni/Desktop/run_script_after_reboot"
# Path to the current file that will be runned after restart
SCRIPT_PATH=$(readlink -f "$0")


# Check if the flag file does not exists
if [ ! -f $REBOOT_FLAG ]; then

	# Remove CUDA from computer if pre installed to start fresh

	# Uninstall CUDA Toolkit
	sudo apt-get purge --auto-remove $(dpkg -l | grep '^ii' | grep cuda | awk '{print $2}')
	# Remove cuda directories
	sudo rm -rf /usr/local/cuda-*

	# Create the flag to continue from here after reboot
	touch $REBOOT_FLAG
	
	sudo reboot
	
# If the file already exists means that we already rebooted the system
else 	

	# Delete the flag file an continues
	rm -f $REBOOT_FLAG
	
	#If the nvcc is not installed install it using apt
	if ! command -v nvcc &> /dev/null; then

		# Dowload an installation of cuda 11.8

		# Dowload the installation file
		wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda_11.8.0_520.61.05_linux.run
		# Run the installation file
		sudo sh cuda_11.8.0_520.61.05_linux.run
	else
		echo 'Error while removing current CUDA version'
	fi

	# Adding CUDA to the PATH variable if not exist
	if ! cat ~/.bashrc | grep -q "/usr/local/cuda-11.8/bin"; then
		echo "export PATH=\$PATH:/usr/local/cuda-11.8/bin" >> ~/.bashrc
	fi
	source ~/.bashrc


	# Check if the nvcc is working
	if command -v nvcc &> /dev/null;then
	   	echo 'CUDA was installed with sucess'
	else
		echo 'Error while instaling CUDA 11.8'
	fi

	# Install cudNN - For this CUDNN Debian Local Installation should be in the same folder as the script
	
	# Enable the local repository
	sudo dpkg -i "cudnn-local-repo-ubuntu2204-"$CUDNN_VERSION"_1.0-1_amd64.deb" 

	# Import the CUDA GPG key
	sudo cp /var/cudnn-local-repo-*/cudnn-local-*-keyring.gpg /usr/share/keyrings/

	# Refresh the repository meta data
	sudo apt-get update

	# Install the run time library
	sudo apt-get install "libcudnn8="$CUDNN_VERSION"-1+cuda"$CUDA_VERSION

	# Install the developer library 
	sudo apt-get install "libcudnn8-dev="$CUDNN_VERSION"-1+cuda"$CUDA_VERSION

	# Install the code samples 
	sudo apt-get install "libcudnn8-samples="$CUDNN_VERSION"-1+cuda"$CUDA_VERSION

	# Verify the cudNN instalation
	cp -r /usr/src/cudnn_samples_v8/ $HOME
	cd  $HOME/cudnn_samples_v8/mnistCUDNN
	make clean && make
	./mnistCUDNN

	echo " If 'Test passed' was not printed in the terminal check for errors during the cudNN installation"
fi
