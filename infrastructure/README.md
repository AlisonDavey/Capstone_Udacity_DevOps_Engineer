## Jenkins Instructions from the Course

### CREATE JENKINS IAM ON AWS
1. Log in to the AWS management console, as a Root user. 
2. Find and select the IAM (Identify and Access Management) service.
3. Click on "Group" menu item from the left sidebar.
4. Create a new group and name it "jenkins", and attach the following policies:

AmazonEC2FullAccess
AmazonVPCFullAccess
AmazonS3FullAccess.
Create an IAM user

5. Click on "Users" menu item from the left sidebar.
6. Create a new IAM User, select "Users" from the left sidebar, then "Add user,"
and use "jenkins" as the user name.
7. Click on both "programmatic access" and "AWS management console access." The defaults for auto-generated password and "users must create a new password at next sign-in" should be kept.
8. Hit "Next", and add the "jenkins" user to the "jenkins" group.
9. Hit "next," no need to add "Tags." Review, and accept. 
10. Capture the Access Key, Secret Access Key, and the password so that you can log in as 
IAM user in the next step (just download the csv file).

11. Sign in as the jenkins IAM user in a new browser window.
12. Create a new key pair for access to your instance(s). 
13. Choose EC2 as the service after logging in. 
14. Select "Key Pairs" from the sidebar on the left, 
from the "Network and Security" section. Enter the "pipeline" name when prompted.
15. Save the ".pem" file.

### Connecting to your Linux instance from Windows using PuTTY
1. Download and install PuTTY https://www.chiark.greenend.org.uk/~sgtatham/putty/
2. Locate the private key (.pem file) for the key pair that you specified when you launched the instance.
3. Convert the .pem file to a .ppk file for use with PuTTY.
 - To convert your private key
	- From the Start menu, choose All Programs, PuTTY, PuTTYgen.
	- Under Type of key to generate, choose RSA.
	- Choose Load. By default, PuTTYgen displays only files with the extension .ppk.
	- To locate your .pem file, choose the option to display files of all types.
	- Select your .pem file for the key pair that you specified when you launched your instance and choose Open.
	- PuTTYgen displays a notice that the .pem file was successfully imported. Choose OK.
	- To save the key in the format that PuTTY can use, choose Save private key.
	- PuTTYgen displays a warning about saving the key without a passphrase. Choose Yes.
	- Specify the same name for the key that you used for the key pair (for example, my-key-pair) and choose Save.
	- PuTTY automatically adds the .ppk file extension.
- To connect to your instance using PuTTY
	- Start PuTTY (from the Start menu, choose All Programs, PuTTY, PuTTY).
	- In the Category pane, choose Session and complete the following fields:
		- Host Name ec2-....us-east-2.compute.amazonaws.com
		- Ensure that the Port value is 22.
		- Under Connection type, select SSH.
		- In the Category pane, expand Connection, expand SSH, and then choose Auth. 
			- Complete the following:
				- Choose Browse.
				- Select the .ppk file that you generated for your key pair and choose Open.
				- Choose Open.
4. When the terminal window opens login as ubuntu

### CREATE A JENKINS SERVER ON AWS EC2
1. Run the jenkins template on CloudFormation. Open EC2 instance using putty
2. In browser open http::/ec2-....us-east-2.compute.amazonaws.com:8080
paste in password that can be seen from
$ source .bashrc
$ sudo cat /var/lib/jenkins/secrets/initialAdminPassword
on the EC2 instance accessed via 
3. Install suggested plugins.
4. Create the admin user and make note of both the user and password to use in the future.
5. Confirm the preferred URL for the Jenkins instance,click save and finish.
6. Top left: jenkins-administar jenkins-administar plugins / Todos los plugins/ 
Blue Ocean - Blue Ocean Aggregator - Instalar sin reiniciar /
Embeddable Build Status - Instalar sin reiniciar /
CloudBees Docker Build & Publish - Instalar sin reiniciar / 
Pipeline: AWS Steps - Instalar y reiniciar
$ sudo systemctl restart jenkins
7. Log in / Open Blue Ocean / create pipeline
8. Select GitHub containing a Jenkinsfile from the options available, generate a token
select the default scopes in the opened link.
9. Click on gear icon to edit the job directly. "Scan repository triggers" and click on 
"Periodically if not otherwise run," select an interval of 2 minutes.
10. Leave the Blue Ocean GUI, and go back to the main Jenkins page.
Click on the “Administar Jenkins” link from the sidebar.
Scroll down to "Manage credentials"
Click on "(global)" and then "Add credentials"
Choose "AWS Credentials" from the dropdown, add "aws-jupyter" on ID, add a description 
and fill in the AWS Key and Secret Access Key generated when the jenkins IAM role was created.
Also using docker user name and password add global docker-hub-credentials.
11. For docker commands to run from the Jenkinsfile $sudo setfacl -m user:jenkins:rw /var/run/docker.sock
12. Keep this EC2 running for Jenkins.
