require 'spec_helper'

RSpec.describe Api::V1::TagsController, type: :controller do

  describe 'when GET #index' do
    before(:each) do
      4.times {
        FactoryGirl.create :tag
      }
      get :index
    end

    it 'returns 4 tags from the database' do
      expect(json_response[:tags].length).to eq(4)
    end

    it { should respond_with 200 }
  end

  describe 'when GET #show' do
    before(:each) do
      @tag = FactoryGirl.create :tag
      get :show, id: @tag.id
    end

    it 'returns the selected tag as json' do
      expect(json_response[:tag][:tag]).to eql @tag.tag
    end
    it { should respond_with 200 }
  end

  describe "when PATCH/PUT #update" do
    before(:each) do

    end
  end

  describe 'when DELETE #destroy' do

  end

end
