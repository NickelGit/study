module Inatra
  @routes = {}

  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def get(path, &block)
      @routes['GET'] = { path => block }
    end

    def post(path, &block)
      @routes['POST'] = { path => block }
    end

    def call(env)
      request_method = env['REQUEST_METHOD']
      path = env['PATH_INFO']
      @routes[request_method][path].call
    end
  end
end
