Inatra.routes do
  get '/hello' do
    [200, {}, ['Hello World']]
  end

  get '/hello/another' do
    [200, {}, ['Hello World']]
  end

  post '/hello' do
    [200, {}, ['Hello World! POST']]
  end
end
