gems = %w[kitchen-pester kitchen-hyperv kitchen-dsc kitchen-azurerm azure-credentials pry pry-byebug pry-stack_explorer appbundle-updater]
gems.each do |gem|
  chef_gem gem do
    compile_time false if respond_to?(:compile_time)
  end
end

extensions = %w[ ms-vscode.PowerShell msazurermtools.azurerm-vscode-tools Pendrica.Chef ]
extensions.each do |ext|
  execute "install vscode extension #{ext}" do
    command "code --install-extension #{ext}"
  end
end


powershell_script 'Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force' do
end

modules = %w[ PSReadline ]
modules.each do |mod|
  powershell_script "Install-Module #{mod} -Force" do
  end
end

directory 'C:\Chef_repo' do
  recursive true
  action :create
end

execute 'chef generate repo working_repo -p' do
  cwd 'C:/Chef_repo/'
end

execute 'chef generate repo testing_repo -p' do
  cwd 'C:/Chef_repo/'
end