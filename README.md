# Getting started with BeeltleboxCI and Vitis: Running FAST 


This is a tutorial designed to show how to get started using BeetleboxCI and Vitis, in which we will cover the following: 

- **Design** - First we will set up a Vitis Vision project and make an accelerated fast kernel 
- **Simulate**  - Second we will simulate this in Vitis by setting up a test bench 
- **BeetleboxCI Integratation** - Then we will integrate our Project and testbench with Beetlebox CI 
- **Review**  - To finish we will compare the simulation results 

## Design
1. Create a directory called workspace in the Vitis folder and change it to be the current working directory. Then we may launch Vitis. The following script assumes that Vitis was installed in the default directory. If it was not, then use the correct installation directory. 

```sh
# Make workspace
cd /tools/Xilinx/Vitis/2020.1 
mkdir workspace 
cd /tools/Xilinx/Vitis/2020.1/workspace
source /tools/Xilinx/Vitis/2020.1/settings64.sh
vitis
```


[Download the following from Xilins vitis embedded 2020.1 downloads , which may be found here.](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-platforms/2020-1.html) 

ZCU104 Base 2020.1 and extract this to the vitis platform folder. 
Next the ZYNQMP common image, extract this to the workspace folder, then enter the folder and open up a terminal and run the following <code>./sdk.sh</code> Extract to the following directory  <code>/tools/Xilinx/Vitis/2020.1/workspace/</code> now open a file browser in that location and copy the <code>aarch64-xilinx-linux</code> folder to the workspace folder

2. Clone the project 
   1. Enter the project root directory
   2. Run the following to build the SW emulation <code>./Emulation-SW/build.sh</code>
   3. Run the following to build the HW emulation <code>./Emulation-HW/build.sh</code>
   4. Run the following to build the Hardware<code>Hardware/build.sh</code>
## Simulate
3. running the Simulations 
   1. Enter the project root directory
   2. Run  the SW emulation <code>./sw_emu.sh</code>
   3. Run  the HW emulation <code>./sw_emu.sh</code>

## Ci integration 
Now we have verified our FAST locally, we will integrate it with BeetleboxCI. Using BeetleboxCI will allow us to regularly iterate on the FAST, so any changes such as additional modules can be automatically tested. It will also allow us to run simulations for long periods of time without using local computing resources, allowing us too focus on other parts of a system.

1. [Create a new Github Repository.](https://docs.github.com/en/github/importing-your-projects-to-github/importing-source-code-to-github/adding-an-existing-project-to-github-using-the-command-line) Name the repository <code>test_fast_CI</code>. and upload the project to it.
2. [Now log into your BeetleboxCI account here.](https://app.beetleboxci.com/)
3. You will see the following screen, click <code>Artifact Store</code>  then <code>Artifact Store</code>  Upload Atifact
4. Upload the platform that we downloaded from Xilinx 
5. Next upload the sysroot and choose library 
6. Then upload the common image 



7. Fill in the details then click <code>Submit</code>. You will be presented with your personal github webhook and deploy key information.

1. Leave this information open and head to your git repo. From here go to the project settings, then click <code>Webhooks</code> then click <code>Add webhook</code>. 
2.  Copy the payload url from the CI to the github settings then change the content type to <code>application/json</code>, then copy over the secret from the ci to Github, then click <code>Add webhook</code>.

1.  We should then see a green tick to say the git repo has connected correctly.
2.  Now in the Github Settings, navigate to the <code>Deploy keys</code> and click <code>Add deploy keys</code>.
3.  Title the deploy key <code>testci</code> and copy and paste the deploy key from the CI into the key input. Then click finish.


1.  Now to run the project on the CI, we must commit to the git repo. This will trigger the webhook and the CI will start building. For this example we can simply edit the <code>readme.md</code> file.

2.  In the project repo there will be a button saying add readme file click this and follow the instruction.

3.  When you have committed the readme to the project the ci will pick this up and start building. When the build is finished the ci will tell you.

## Review

1. Open the project in the CI  
2. Navigate to the logs of the test-se-emulation
3. Click logs
4. Compare this to the simulation output of the vitis terminal 
