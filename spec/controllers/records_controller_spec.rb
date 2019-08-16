require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
  let(:briq) { create :briq }
  let(:record) { create :record }
  describe '#index' do
    subject { get :index }
    it 'returns a 200 status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    subject { get :show, params: { id: record.id, briq_id: briq.id } }

    it 'should return success status' do
      subject
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#import_new' do
    subject { get :import_new, params: { briq_id: briq.id } }

    it 'should return success status' do
      subject
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#destroy' do
    subject { delete :destroy, params: { id: record.id, briq_id: briq.id } }

    it 'should return no content status' do
      subject
      expect(response).to have_http_status(302)
    end
  end
end
