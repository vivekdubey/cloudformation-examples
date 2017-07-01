require 'cloudformation_stack'
def deploy(params, credentials, region)
  cf_stack = CFStackService.new(
      params[:stack_name],
      params[:template_body],
      params[:template_params],
      credentials,
      region
    )
  cf_stack.deploy(params[:disable_rollback], params[:timeout])
end
