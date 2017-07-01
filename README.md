# cloudformation-examples
Examples of different cloudformation templates to deploy various resources in AWS using a rubygem created in a different repository. Rubygems - https://github.com/vivekdubey/cloudformation_stack/tree/v4.
### Steps involved in deploying the application
- Creation of VPC with private and public subnet. 
- Creation of a DB instance. 
- Creation of an Autoscaling group with an Elastic Load Balancer to load balance requests between all healthy instances. 
### Extra features
- Cross cloudformation stack reference to create a pipeline of CF stacks. 
- **Example:**
  - Exports from VPC cloudformation stack:
    - VPC ID
    - Public Subnets' ID
    - Private Subnets' ID
  - Exports from RDS cloudformation stack:
    - RDS hostname.
    - RDS port.
### Commands to deploy sample cloudformation templates 
- Deploying cloudformation stack using the gem mentioned above is done through rake tasks.
- There are multiple rack tasks for different cloudformation stacks.
- Details of rake tasks are mentioned in `./deployment-scripts` 
