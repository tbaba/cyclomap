require 'spec_helper'

feature 'Users' do
  let(:user) { create :user }

  describe 'edit user' do
    context '非ログイン時' do
      # TODO 403を返すようにする
      scenario 'ページが見つからない'
    end

    context 'ログイン時' do
      let(:new_screen_name) { Faker::Internet.user_name }
      include_context 'sign in'

      scenario 'ユーザー情報を編集する' do
        visit root_path
        find('.nav-user-link').click

        find('.edit-user-link').click

        fill_in 'user_screen_name', with: new_screen_name

        find('.submit-button').click

        expect(page).to have_content 'ユーザー情報を更新しました'
        within '.user-header .name' do
          expect(page).to have_content new_screen_name
          expect(page).not_to have_content user.screen_name
        end
      end
    end
  end
end
