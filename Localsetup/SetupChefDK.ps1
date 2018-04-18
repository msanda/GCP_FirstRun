Set-ExecutionPolicy Unrestricted

# sync what has already been installed with choclatey
choco list -lo
# install applications

# Install the latest stable ChefDK
invoke-restmethod 'https://omnitruck.chef.io/install.ps1' | iex
install-project chefdk -verbose

# Use Chef Apply to setup 
chef-apply c:/basic.rb