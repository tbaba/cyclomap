shared_context 'sign in' do
  background do
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      uid: user.uid,
      provider: 'twitter',
      info: {
        image: 'image.png'
      }
    })

    visit root_path
    click_link 'Login with Twitter'
  end
end
