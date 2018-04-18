Set-ExecutionPolicy Unrestricted

# Chocolatey
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# sync what has already been installed with choclatey
choco list -lo
# update powershell
choco install powershell --force --force-dependencies -y

# install sysinternals to  C:\ProgramData\chocolatey\lib\sysinternals\tools if you want to change the location use --params "'/installationpath:C:\ProgramData\sysinternals'"
choco install poshgit --force --force-dependencies -y

#Debugging tcp/Http request
choco install fiddler4 --force --force-dependencies -y

#I personally do network test form my machine to others, so this stays. 
choco install iperf3 --force --force-dependencies -y
Install-Module -Name Psake
Install-Module Pester -Force -SkipPublisherCheck
Install-Module -Name PSScriptAnalyzer



#Make SSH directory in you user space
mkdir $env:USERPROFILE\.ssh

#Setup Teraform Locally
choco install terraform --force --force-dependencies -y

# restart Computer after everything has been installed
shutdown /r /t 0 /d P:0:0
