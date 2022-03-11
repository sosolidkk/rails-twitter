# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'when creating a new tweet' do
    it { is_expected.to validate_presence_of(:body) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_one_attached(:image) }
  end
end
