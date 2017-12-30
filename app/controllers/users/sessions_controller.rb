class Users::SessionsController < Devise::SessionsController

  def new
    super
  end

  # def new
  #   self.resource = resource_class.new(sign_in_params)
  #   clean_up_passwords(resource)
  #   #yield resource if block_given?
  #   #render 'devise/sessions/new'
  #   render 'top/index'
    
  #   #redirect_to 'top/index'
  #   #clean_up_passwordss(resource)
  #   #yield resource if block_given?
  #   #respond_with(resource, serialize_options(resource))
   
  # end
  
  def new
    self.resource = resource_class.new(sign_in_params)
    logger.debug("SSSSSSSSSSSSSSSSS" + "ssss")
    logger.debug(resource)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end
  
  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { methods: methods, only: [:password] }
  end
end