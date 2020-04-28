require './test/test_helper'
require 'test/unit'
require 'rack/test'
require_relative './inatra'
require_relative './my_app'

class RackTest < Test::Unit::TestCase
  def setup
    @browser = Rack::Test::Session.new(Rack::MockSession.new(Inatra))
  end

  def test_it_says_hello_world
    @browser.get '/hello'
    assert @browser.last_response.ok?
    assert_equal 'Hello World', @browser.last_response.body
  end

  def test_it_says_hello_world_another_path
    @browser.get '/hello/another'
    assert @browser.last_response.ok?
    assert_equal 'Hello World AGAIN', @browser.last_response.body
  end

  def test_it_says_hello_world_to_post
    @browser.post '/hello'
    assert @browser.last_response.ok?
    assert_equal 'Hello World! POST', @browser.last_response.body
  end
end
