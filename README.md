# Consideration, 

VPC CIDR -  10.y.0.0/16
Private Subnet CIDR - 10.y.0.0/25 (Route Table through Nat Gateway)

Your Local Network CIDR - 10.x.0.0/16 to access Nodes.

Note: Change values in sg.tf file under `ec2_nodes` and `prometheus` project to match with above mentioned values.

`x` and `y` values can be same or different. In my case, those were different.

# Step 1 - Setting Up EC2 nodes:

-- Please read through variable.tf file and change values to fit to your requirement.
-- Please change CIDR Values based on your requirement. Just make sure, CIDR value must match from the Subnet Group - where you are going to pick to launch your instances.

Go to ec2 terraform project and run below commands in sequence(input values whereever those are not set by default):

terraform init
terraform plan
terraform apply

Note: If credentails are not set as default then we need to mention profile name while running above mentioned commands:

AWS_PROFILE=<XYZ> terraform init
AWS_PROFILE=<XYZ> terraform plan
AWS_PROFILE=<XYZ> terraform plan

Output will be generated for these 2 instances that will be used in Step 2. As of now only 2 instances are considered for the test case.

# Step 2 - To install Node Exporter on EC2 Nodes:

Go to ansible folder, before running the playbook.

Please make sure your profile has been set with correct ACCESS_KEY and SECRET_KEY values, if it is set as default, then the command can be run as:

`ansible-playbook -i ec2.py -l <Instance_ID> -e 'ansible_ssh_user=ubuntu' -e 'ansible_python_interpreter=/usr/bin/python3' playbook-prometheus-node-exporter.yml`

If not, then:

`AWS_PROFILE=<XYZ> ansible-playbook -i ec2.py -l <Instance_ID> -e 'ansible_ssh_user=ubuntu' -e 'ansible_python_interpreter=/usr/bin/python3' playbook-prometheus-node-exporter.yml`

Note: Instance ID will be given after running ec2 terraform project, server_id1 and server_id2, that can be replaced above to install node exporter on both of the nodes. Node exporter will be running on port 7100. ec2.py has been used for dynamic inventory, also kept in a folder.

# Step 3 - Setting Up Prometheus Server

-- Go to prometheus/config/prometheus.yml --

Make sure Access Key and Secret Key is defined there, otherwise it will not pick instances to be monitored by Prometheus.

-- Go to prometheus terraform project and run below commands in sequence(input values whereever those are not set by default):

terraform init
terraform plan
terraform apply

Note: If credentails are not set as default then we need to mention profile name while running above mentioned commands:

AWS_PROFILE=<XYZ> terraform init
AWS_PROFILE=<XYZ> terraform plan
AWS_PROFILE=<XYZ> terraform plan
