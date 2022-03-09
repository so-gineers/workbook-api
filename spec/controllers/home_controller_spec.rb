# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController do
  describe 'GET #index' do
    before { get :index }

    context 'response status' do
      subject { response }
      it { is_expected.to have_http_status(:success) }
    end

    context 'response status' do
      subject { JSON.parse(response.body) }
      it { is_expected.to eq({ 'message' => 'nangadef'}) }
    end
  end
end
