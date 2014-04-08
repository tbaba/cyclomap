require 'spec_helper'

feature 'Stars' do
  let(:user) { create :user }
  let(:course) { create :course, user: create(:user) }

  describe 'new star' do
    context '非ログイン時' do
      scenario 'スターを付けることが出来ない' do
        visit course_path(course)
        expect(page).not_to have_css '.new-star-link' 
      end
    end

    context 'ログイン時' do
      include_context 'sign in'

      scenario 'とあるコースにスターを付ける' do
        visit course_path(course)

        find('.new-star-link').click

        expect(page).to have_content 'スターを付けました'
      end
    end
  end
end
