# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'when creating a new comment' do
    it { is_expected.to validate_presence_of(:body) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:tweet) }
  end
end
