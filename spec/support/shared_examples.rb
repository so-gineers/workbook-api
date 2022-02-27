# frozen_string_literal: true

shared_examples 'ensure auth token is valid' do
  ['', 'ffff', nil].each do |a_token|
    let(:token) { a_token }
    let(:submission_id) { SecureRandom.uuid }

    it "token value: #{a_token} responds with not_authorized" do
      request_with_fake_token

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
