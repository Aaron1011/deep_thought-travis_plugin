require File.expand_path '../test_helper.rb', __FILE__

class DeepThoughtTravisPluginTest < MiniTest::Unit::TestCase
  def setup
    DatabaseCleaner.start

    @travis_plugin = DeepThought::CIService::TravisPlugin.new
  end

  def teardown
    DatabaseCleaner.clean
  end

  def test_travis_setup_success
    @travis_plugin.setup?({"CI_SERVICE_ENDPOINT" => "endpoint"})

    assert @travis_plugin.endpoint == 'endpoint'
  end

  def test_travis_plugin_is_branch_green_success
    # successful test with CI service (I suggest stubbing the payload and mocking the API call)

    json = stub(:body => '{"branch": {"state": "passing"}}')
    HTTParty.expects(:get).with("#{@travis_plugin.endpoint}/repos/app/branches/branch").returns(json)

    assert @travis_plugin.is_branch_green?('app', 'branch', '')
  end

  def test_travis_plugin_is_branch_green_failed
    # failed test with CI service (I suggest stubbing the payload and mocking the API call)

    json = stub(:body => '{"branch": {"state": "failed"}}')
    HTTParty.expects(:get).with("#{@travis_plugin.endpoint}/repos/app/branches/branch").returns(json)

    assert !@travis_plugin.is_branch_green?('app', 'branch', 'hash')
  end

  def test_travis_plugin_is_branch_green_missing
    # failed test with CI service (I suggest stubbing the payload and mocking the API call)

    json = stub(:body => '{"branch": {"id": 123}}')
    HTTParty.expects(:get).with("#{@travis_plugin.endpoint}/repos/app/branches/branch").returns(json)

    assert !@travis_plugin.is_branch_green?('app', 'branch', 'hash')
  end
end
