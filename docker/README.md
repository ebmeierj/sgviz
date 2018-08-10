# SGViz docker image    

#### Purpose:   
- Automate the configuration review of AWS Security Groups, ACLS VPCs
- Automate the diagramming of our AWS Security groups and VPCs         

This is an effort to automate the review of AWS VPCs, SG', ACLs etc..

What is SGViz:      
A visualization tool for AWS VPC Security Groups.    
[SGViz](https://github.com/y13i/sgviz)           

how to run it:
* Log in to AWS in your local environment
* You can either put the AWS config variables in your environment or specify them on the command line to sgviz
```bash
docker-compose run sgviz sgviz generate -k ${sgviz_key_id} -s ${sg_viz_key} -r ${aws_region} --vpc-ids=${vpc-id} --output-path=/diagrams/${vpc-id}
```    
```bash
docker-compose run -e AWS_DEFAULT_REGION=us-west-1 sgviz sgviz generate --vpc-ids=${vpc-id} --output-path=/diagrams/${vpc-id}
```    
