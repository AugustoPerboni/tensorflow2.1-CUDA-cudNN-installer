# CUDA and cuDNN Installation Guide for TensorFlow 2.14 for Ubuntu🚀
This guide will help you seamlessly install CUDA and cuDNN for TensorFlow 2.14 on your Ubuntu machine. Please follow the steps diligently. 🛠️

## Prerequisites 📋
- Ensure you have administrative rights on your machine.
- Download the cuDNN Debian Local Installation file from the [official NVIDIA website](https://developer.nvidia.com/cudnn).
- Place the downloaded cuDNN file in the same directory as the installation script.

## Installation Steps 📜
1. 📥 **Download the Script:** First things first, get the installation script from this repository.

2. 🔐 **Give Permission:** Navigate to the directory containing the script and grant execute permissions: `chmod +x your_script_name.sh`

3. ▶️ **Run the Script:** Initiate the installation process: `./your_script_name.sh`

4. 🔄 **System Reboot:** The script may reboot your system during the process. Don't panic! It's part of the plan. Once the system restarts, the script will automatically continue from where it left off.

5. 🖥️ **CUDA Installation:** After the reboot, the script will proceed with the CUDA installation.

6. 🧠 **cuDNN Installation:** Once CUDA is in place, the script will handle the cuDNN installation. Please ensure the cuDNN Debian Local Installation file you downloaded earlier is in the same directory as the script.

**Verification:** At the end, the script will run a cuDNN sample test. If you see the "Test passed" message in the terminal, congrats! 🎉 Your installation was successful. If not, please check the terminal logs for any errors.

## Notes 📌
- This script installs CUDA version 11.8 and cuDNN version 8.7.0.84 by default. If you want to change these versions, edit the `CUDA_VERSION` and `CUDNN_VERSION` variables in the script.
- Always ensure you have the compatible versions of CUDA and cuDNN for your specific TensorFlow release.

## Troubleshooting 🛠️
If you face any issues during the installation, retrace your steps using this guide. Ensure that the cuDNN file you downloaded is compatible with your CUDA version. If issues persist, raise an issue on this GitHub repository.

##  Please contribute! 🤝
This code is still very limited for specific hardware and OS caracteristics, fell free to help making it more generalized for multiple scenarios.

---

Best of luck with your deep learning adventures! 🤖🚀 If you found this guide helpful, consider giving it a ⭐ on GitHub!
