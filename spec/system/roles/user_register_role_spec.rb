require 'rails_helper'

describe 'Usuário cadastra papel' do
  it 'e não está logado' do
    
  end

  it 'com sucesso' do
    actor = FactoryBot.create(:actor, name: 'Marcos', date_of_birth: '2024-12-02', nationality: 'Brasileiro')
    user = FactoryBot.create(:user, email: 'joao@email.com', password: '123456789')
    login_as user

    visit root_path
    within('nav') do
      click_on 'Atores'
    end
    click_on 'Marcos'
    click_on 'Adicionar Papel'
    fill_in 'Descrição', with: 'Harry Potter'
    click_on 'Criar Papel'

    expect(page).to have_content 'Harry Potter'
    expect(page).to have_content 'Papel adicionado com sucesso.'
  end

  it 'com dados errados' do
    
  end
end
