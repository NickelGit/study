module Inatra
  @routes = {}

  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def method_missing(missing_method_name, *args, &block)
      if args.length == 1
        @routes[missing_method_name.to_s.upcase] ||= {}
        @routes[missing_method_name.to_s.upcase][args[0]] = block
      else
        super
      end
    end

    def respond_to_missing?(method_name, *_args)
      @routes.include?(method_name.to_s.upcase)
    end

    def call(env)
      request_method = env['REQUEST_METHOD']
      path = env['PATH_INFO']
      func = @routes[request_method][path]
      func ? func.call : [404, {}, ['Not Found']]
    end
  end
end
