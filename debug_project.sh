#!/bin/bash 

# If the SDK does not launch, need to clear metadata 
rm -rv ./Zybo_DSP_Application/.metadata 
rm -rv ./Zybo_DSP_Application/.sdk/
rm -rv ./Zybo_DSP_Application/.Xil/
echo "Clear done --"
# Launch project
./launch_project.sh

