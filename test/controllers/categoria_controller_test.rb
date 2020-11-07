require 'test_helper'

class CategoriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoria = categoria(:one)
  end

  test "should get index" do
    get categoria_url
    assert_response :success
  end

  test "should get new" do
    get new_categoria_url
    assert_response :success
  end

  test "should create categoria" do
    assert_difference('Categoria.count') do
      post categoria_url, params: { categoria: { ativo: @categoria.ativo, descricao: @categoria.descricao } }
    end

    assert_redirected_to categoria_url(Categoria.last)
  end

  test "should show categoria" do
    get categoria_url(@categoria)
    assert_response :success
  end

  test "should get edit" do
    get edit_categoria_url(@categoria)
    assert_response :success
  end

  test "should update categoria" do
    patch categoria_url(@categoria), params: { categoria: { ativo: @categoria.ativo, descricao: @categoria.descricao } }
    assert_redirected_to categoria_url(@categoria)
  end

  test "should destroy categoria" do
    assert_difference('Categoria.count', -1) do
      delete categoria_url(@categoria)
    end

    assert_redirected_to categoria_url
  end
end
