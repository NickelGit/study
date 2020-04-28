module Inatra
  @routes = {}

  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def get(path, &block)
      add_route('GET', path, &block)
    end

    def post(path, &block)
      add_route('POST', path, &block)
    end

    def call(env)
      request_method = env['REQUEST_METHOD']
      path = env['PATH_INFO']
      @routes[request_method][path].call
    end

    private

    def add_route(method, path, &block)
      @routes[method] = {} if @routes[method].nil?
      @routes[method][path] = block
    end
  end
end
