require 'test_helper'

class SessoesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessoes_new_url
    assert_response :success
  end

end
