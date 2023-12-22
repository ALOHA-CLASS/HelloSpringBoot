
# cd workspace
cd /home/joeun/workspace

# Create a folder
mkdir actions-runner && cd actions-runner


# Download the latest runner package
curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz# Optional: Validate the hash


echo "29fc8cf2dab4c195bb147384e7e2c94cfd4d4022c793b346a6175435265aa278  actions-runner-linux-x64-2.311.0.tar.gz" | shasum -a 256 -c

# Extract the installer
tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz




# Create the runner and start the configuration experience
./config.sh --url https://github.com/ALOHA-CLASS/HelloSpringBoot --token AMYQQ36LN4FPUJULB4TBVFDFQVC46

# Last step, run it!
./run.sh