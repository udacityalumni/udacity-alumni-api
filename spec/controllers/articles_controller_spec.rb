require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :controller do

  let(:valid_attributes) {
    build(:article).attributes.symbolize_keys
  }

  let(:invalid_attributes) {
    { test: 1 }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all articles as @articles" do
      article = Article.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:articles)).to eq([article])
    end
  end

  describe "GET #show" do
    it "assigns the requested article as @article" do
      article = Article.create! valid_attributes
      get :show, params: {id: article.to_param}, session: valid_session
      expect(assigns(:article)).to eq(article)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Article" do
        expect {
          post :create, params: {article: valid_attributes}, session: valid_session
        }.to change(Article, :count).by(1)
      end

      it "assigns a newly created article as @article" do
        post :create, params: {article: valid_attributes}, session: valid_session
        expect(assigns(:article)).to be_a(Article)
        expect(assigns(:article)).to be_persisted
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: "testing"}
      }

      it "updates the requested article" do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: new_attributes}, session: valid_session
        article.reload
        # skip("Add assertions for updated state")
        expect(assigns(:article)).to eq(article)
      end

      it "assigns the requested article as @article" do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: valid_attributes}, session: valid_session
        expect(assigns(:article)).to eq(article)
      end
    end

    context "with invalid params" do
      it "assigns the article as @article" do
        article = Article.create! valid_attributes
        put :update, params: {id: article.to_param, article: invalid_attributes}, session: valid_session
        expect(assigns(:article)).to eq(article)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested article" do
      article = Article.create! valid_attributes
      expect {
        delete :destroy, params: {id: article.to_param}, session: valid_session
      }.to change(Article, :count).by(-1)
    end
  end

end
