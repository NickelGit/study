Inatra.routes do
  get '/hello' do
    [200, {}, ['Hello World']]
  end

  get '/hello/another' do
    [200, {}, ['Hello World AGAIN']]
  end

  post '/hello' do
    [200, {}, ['Hello World! POST']]
  end

  get '/ping' do
    [200, {}, ['PONG']]
  end

  post '/bye' do
    [200, {}, ['Bye Bye']]
  end
end
