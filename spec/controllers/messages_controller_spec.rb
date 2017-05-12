require 'rails_helper'

describe MessagesController do
  context "when user is signed in" do
    login_user
    let(:group) { create(:group, user_ids: [user.id]) }
    let(:message) { build(:message) }

    describe 'GET #index' do
      it "assigns the requested group to @group" do
        get :index, group_id: group
        expect(assigns(:group)).to eq group
      end

      it "renders the :index template" do
        get :index, { group_id: group }
        expect(response).to render_template :index
      end
    end

    describe 'POST #create' do
      it "assigns the requested message to @message" do
        get :index, group_id: group
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "saves the new message in the database" do
        expect{
            post :create, {
              group_id: group,
              message: { body: 'テストメッセージ' }
            }
          }.to change(Message, :count).by(1)
      end

      it "redirects to group_messages_path" do
        post :create, { group_id: group, message: { body: message }}
        expect(response).to render_template :index
      end
    end
  end

  context "when user is not signed in" do
    let(:group) { create(:group) }
      describe 'GET #index' do
        it 'redirects to new user session path' do
          get :index, { group_id: group }
          is_expected.to redirect_to new_user_session_path
        end
      end
  end
end
