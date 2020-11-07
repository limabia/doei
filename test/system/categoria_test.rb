require "application_system_test_case"

class CategoriaTest < ApplicationSystemTestCase
  setup do
    @categoria = categoria(:one)
  end

  test "visiting the index" do
    visit categoria_url
    assert_selector "h1", text: "Categoria"
  end

  test "creating a Categoria" do
    visit categoria_url
    click_on "New Categoria"

    check "Ativo" if @categoria.ativo
    fill_in "Descricao", with: @categoria.descricao
    click_on "Create Categoria"

    assert_text "Categoria was successfully created"
    click_on "Back"
  end

  test "updating a Categoria" do
    visit categoria_url
    click_on "Edit", match: :first

    check "Ativo" if @categoria.ativo
    fill_in "Descricao", with: @categoria.descricao
    click_on "Update Categoria"

    assert_text "Categoria was successfully updated"
    click_on "Back"
  end

  test "destroying a Categoria" do
    visit categoria_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Categoria was successfully destroyed"
  end
end
