RSpec.describe 'POST /api/articles' do
  subject { response }

  describe 'with valid params' do
    let(:user) { create(:user) }
    let(:credentials) { user.create_new_auth_token }
    before do
      post '/api/articles', params: {
        article: { title: 'News about coding', body: 'Lorem ipsum...' }
      }, headers: credentials

      @article = Article.last
    end

    it { is_expected.to have_http_status 201 }

    it 'is expected to create an instance of an Article' do
      expect(@article).not_to be nil
    end

    it 'is expected to to have a title' do
      expect(@article.title).to eq 'News about coding'
    end

    it 'is expected to to have a body' do
      expect(@article.body).to eq 'Lorem ipsum...'
    end
  end

  describe 'without valid params' do
    before do
      post '/api/articles', params: {
        article: { title: 'News about coding', body: 'Lorem ipsum...' }
      }, headers: nil
    end

    it { is_expected.to have_http_status 401 }
  end
end
