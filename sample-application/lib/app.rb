def instance_id
  if (ENV['RACK_ENV'] == "development")
    return stub_instance_id
  else
    uri = URI.parse('http://169.254.169.254/latest/meta-data/instance-id')
    response = Net::HTTP.get_response(uri)
    return response.body.strip
  end
end

def stub_instance_id
  "development-#{rand(0..10)}"
end

def refresh_count(service_instance_id)
  if Visit.where(instanceId: service_instance_id).exists?
    return increase_request_count(service_instance_id)
  else
    return new_instance(service_instance_id)
  end
end

def new_instance(service_instance_id)
 Visit.new(instanceId: service_instance_id, count: 1).save
 return 1
end

def total_visits
  views = 0
  Visit.pluck(:count).map{|x| views += x}
  views
end

def visits_per_instance(service_instance_id)
  Visit.where(instanceId: service_instance_id).pluck(:count)[0]
end

def increase_request_count(service_instance_id)
  Visit.where(instanceId: service_instance_id).update_all("count = count + 1")
  Visit.where(instanceId: service_instance_id).pluck(:count)[0]
end
