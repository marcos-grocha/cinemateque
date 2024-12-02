require 'rails_helper'

describe 'Usuário cadastra ator' do
  it 'e não está logado' do
    FactoryBot.create(:user, email: 'joao@email.com', password: '123456789')

    visit new_actor_path

    expect(current_path).to eq new_user_session_path
  end

  it 'com sucesso' do
    user = FactoryBot.create(:user, email: 'joao@email.com', password: '123456789')
    login_as user

    visit root_path
    within('nav') do
      click_on 'Atores'
    end
    click_on 'Adicionar Ator'

    expect(page).to eq 'Vejo já isso'
  end

  it 'com sucesso e vê detalhes' do
    
  end

  it 'com os dados errados' do
    
  end
end
