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
    fill_in 'Nome', with: 'Marcos'
    fill_in 'Data de nascimento', with: '08/07/1997'
    fill_in 'Nacionalidade', with: 'Brasileiro'
    click_on 'Criar Ator'

    expect(page).to have_content 'Marcos'
    expect(page).to have_content 'Nacionalidade: Brasileiro', normalize_ws: true
    expect(page).to have_content 'Ator adicionado com sucesso.'
    expect(page).to have_content 'Papéis'
    expect(page).to have_link 'Adicionar Papel'
  end

  it 'com os dados errados' do
    user = FactoryBot.create(:user, email: 'joao@email.com', password: '123456789')
    login_as user

    visit root_path
    within('nav') do
      click_on 'Atores'
    end
    click_on 'Adicionar Ator'
    fill_in 'Nome', with: ''
    fill_in 'Data de nascimento', with: '08/07/1997'
    fill_in 'Nacionalidade', with: ''
    click_on 'Criar Ator'

    expect(page).to have_content 'Ator não foi adicionado.'
  end
end
