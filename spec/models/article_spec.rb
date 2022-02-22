require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'database' do
    it { is_expected.to have_db_column(:title).of_type(:string)}
    it { is_expected.to have_db_column(:body).of_type(:text)}
  end
end
