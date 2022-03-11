# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification, type: :model do
  context 'when creating a new notification' do
    it { is_expected.to belong_to(:recipient) }
    it { is_expected.to belong_to(:actor) }
    it { is_expected.to belong_to(:notifiable) }
  end
end
