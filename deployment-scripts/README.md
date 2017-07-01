# Rake tasks to deploy different cloudformation tasks.
- Rake tasks uses rubygem : https://github.com/vivekdubey/cloudformation_stack/tree/v4
## Deploy cloudformation stack like VPC/IAM or any stack with no run time parameters:
```
cd deployment-scripts
bundle install --path .bundle
bundle exec rake deploy:default[<aws_profile_name>,<region>,<stack-name>,<relative template path>]
# Example: bundle exec rake deploy:default[aws_profile,ap-southeast-2,sample-vpc,../templates/vpc/cloudformation-withNatGateway.json]
```
## Deploy Sample Application cloudformation stack:
```
cd deployment-scripts
bundle install --path .bundle
bundle exec rake deploy:app[<aws_profile_name>,<region>,<stack-name>,<relative template path>,<AMI Id>,<comma separated DB credentials>]
# Example : bundle exec rake deploy:app[aws_profile,ap-southeast-2,sample-app,../templates/app/cloudformation.json,ami_id,'<username.\,<password>\,<dbname>']
```
## Deploy RDS cloudformation stack:
```
cd deployment-scripts
bundle install --path .bundle
bundle exec rake deploy:rds[<aws_profile_name>,<region>,<stack-name>,<relative template path>,<comma separated DB credentials>]
# Example: bundle exec rake deploy:rds[aws_profile,ap-southeast-2,sample-rds,../templates/rds/cloudformation.json,'<username.\,<password>\,<dbname>']
```

## Extra commands:
```
cd deployment-scripts
bundle install --path .bundle
bundle exec rake -T
```
