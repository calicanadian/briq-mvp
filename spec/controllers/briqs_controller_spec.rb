require 'rails_helper'

RSpec.describe BriqsController, type: :controller do
  let(:briq) { create :briq }
  describe '#index' do
    subject { get :index }
    it 'should return success status' do
      subject
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    subject { get :show, params: { id: briq.id } }
    it 'should return success status' do
      subject
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#new' do
    subject { get :new }
    it 'should return success status' do
      subject
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    subject { post :create, params: { briq: { name: "Test String", description: "Test Description" } } }
    it 'should return success status' do
      subject
      expect(response).to have_http_status(204)
    end
  end

  describe '#update' do
    subject { patch :update, params: { id: briq.id, name: "Updated from test", description: "The description was updated from an automated test" } }
    it 'should return success status' do
      subject
      expect(response).to have_http_status(204)
    end
  end

  describe '#destroy' do
    subject { delete :destroy, params: { id: briq.id } }
    it 'should return success status' do
      subject
      expect(response).to have_http_status(204)
    end
  end
end
