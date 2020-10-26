require 'test_helper'

class ProdutosControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get produtos_path
        assert_response :success
    end
end
