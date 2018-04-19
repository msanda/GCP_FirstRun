

The Purpose of this Project is to show hwo one can deploy to Google cloud platform using a bunch of automated steps.

First of This project is based of a git flow branching strategy. All concepts start off with a Feature branch, which is later merged to the develop branch and merged to master.

Second the layout of this project follows the following

**Application\_deployment** - &gt; this encompasses Ansible scripts to Configure and deploy a public facing git project to the Servers in the instance Group

**Env\_custom** -&gt; environment specify tweaks that a user prefers, such as terminal coloring, aliases and so forth

**Infrastructure** -&gt; This is the terraform scripts used to create the test environment from scratch. It creates a 2 node cluster of ubuntu ngnix servers, behind a load balancer and publicly accessible at port 80, 443 and 22. ( port 80 and 443 are load balanced to ngnix). We also create a GCP cloud sql server within the subnet and is isolated form the outside world.

**Localsetup** -&gt; this is scritps used to create an environment from scratch on a windows machine to communicate with GCP as well as have the basics to start working with terraform and ansible.

**Secrets** -&gt; this folder contains all the Sensitive json files, and are isolated from checkout, via explicit definitions in gitignore.



**How to use**

1. Setup your local dev environment by cloning the repo to your computer. Then running the following scripts in this order
  1. Chocolatesetupscript.ps1
  2. Gce\_setup.ps1
  3. Setup\_chefdk.ps1
2. Download your GCP access key file from google and place it in the secres folder under the name &quot;account\_gc.json&quot;
3. Change directory to Infrastructure
  1. Run terraform init under this folder ( Note you will fail this step if your gcp key is not in the secrts folder)

