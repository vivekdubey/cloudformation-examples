# cloudformation-examples
Examples of different cloudformation templates to deploy various resources in AWS using a rubygem created in a different repository. Rubygems - https://github.com/vivekdubey/cloudformation_stack.

## Deployment of a sample sinatra application
Example application does following operations:
- Displays total number of page views.
- ID of the instance serving the request.
- Number of requests served per instance of the application. 
- Count of each requests is stored in postgres database. 

### Steps involved in deploying the application
- Creation of VPC with private and public subnet. 
- Creation of a DB instance. 
- Creation of an Autoscaling group with an Elastic Load Balancer to load balance requests between all healthy instances. 
### Extra features
- Cross cloudformation stack reference to create a pipeline of CF stacks.  
