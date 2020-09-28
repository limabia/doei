
Dado('que estou na página inicial') do
    visit '/' 
end

Então('deverei ver o link {string}') do |string|
    expect(page).to have_content(string)
end