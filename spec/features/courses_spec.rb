require 'spec_helper'

feature 'Courses' do
  let(:user) { create :user }

  describe 'tagged page' do
    let!(:hillclimb_course) { create :hillclimb }
    let!(:cycling_course) { create :cycling }

    scenario 'とあるタグのページを表示する' do
      visit tagged_courses_path(tag_name: 'ヒルクライム')

      expect(page).to have_content hillclimb_course.title
      expect(page).not_to have_content cycling_course.title
    end
  end
end
