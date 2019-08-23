# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'sign_in' do
    let(:user) { create(:user) }
    let(:mutation) do
      <<~GQL
        mutation {
            signIn(email: "#{user.email}") {
              token
              user {
                email
              }
            }
        }
      GQL
    end

    subject(:result) do
      MartianLibrarySchema.execute(mutation).as_json['data']['signIn']
    end

    it 'returns token and a user' do
      expect(result['token']).not_to be_nil
      expect(result['user']['email']).to eq user.email
    end
  end
end
