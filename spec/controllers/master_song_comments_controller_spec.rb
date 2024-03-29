require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MasterSongCommentsController do

  # This should return the minimal set of attributes required to create a valid
  # MasterSongComment. As you add validations to MasterSongComment, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MasterSongCommentsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all master_song_comments as @master_song_comments" do
      master_song_comment = MasterSongComment.create! valid_attributes
      get :index, {}, valid_session
      assigns(:master_song_comments).should eq([master_song_comment])
    end
  end

  describe "GET show" do
    it "assigns the requested master_song_comment as @master_song_comment" do
      master_song_comment = MasterSongComment.create! valid_attributes
      get :show, {:id => master_song_comment.to_param}, valid_session
      assigns(:master_song_comment).should eq(master_song_comment)
    end
  end

  describe "GET new" do
    it "assigns a new master_song_comment as @master_song_comment" do
      get :new, {}, valid_session
      assigns(:master_song_comment).should be_a_new(MasterSongComment)
    end
  end

  describe "GET edit" do
    it "assigns the requested master_song_comment as @master_song_comment" do
      master_song_comment = MasterSongComment.create! valid_attributes
      get :edit, {:id => master_song_comment.to_param}, valid_session
      assigns(:master_song_comment).should eq(master_song_comment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MasterSongComment" do
        expect {
          post :create, {:master_song_comment => valid_attributes}, valid_session
        }.to change(MasterSongComment, :count).by(1)
      end

      it "assigns a newly created master_song_comment as @master_song_comment" do
        post :create, {:master_song_comment => valid_attributes}, valid_session
        assigns(:master_song_comment).should be_a(MasterSongComment)
        assigns(:master_song_comment).should be_persisted
      end

      it "redirects to the created master_song_comment" do
        post :create, {:master_song_comment => valid_attributes}, valid_session
        response.should redirect_to(MasterSongComment.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved master_song_comment as @master_song_comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        MasterSongComment.any_instance.stub(:save).and_return(false)
        post :create, {:master_song_comment => {}}, valid_session
        assigns(:master_song_comment).should be_a_new(MasterSongComment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        MasterSongComment.any_instance.stub(:save).and_return(false)
        post :create, {:master_song_comment => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested master_song_comment" do
        master_song_comment = MasterSongComment.create! valid_attributes
        # Assuming there are no other master_song_comments in the database, this
        # specifies that the MasterSongComment created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        MasterSongComment.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => master_song_comment.to_param, :master_song_comment => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested master_song_comment as @master_song_comment" do
        master_song_comment = MasterSongComment.create! valid_attributes
        put :update, {:id => master_song_comment.to_param, :master_song_comment => valid_attributes}, valid_session
        assigns(:master_song_comment).should eq(master_song_comment)
      end

      it "redirects to the master_song_comment" do
        master_song_comment = MasterSongComment.create! valid_attributes
        put :update, {:id => master_song_comment.to_param, :master_song_comment => valid_attributes}, valid_session
        response.should redirect_to(master_song_comment)
      end
    end

    describe "with invalid params" do
      it "assigns the master_song_comment as @master_song_comment" do
        master_song_comment = MasterSongComment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MasterSongComment.any_instance.stub(:save).and_return(false)
        put :update, {:id => master_song_comment.to_param, :master_song_comment => {}}, valid_session
        assigns(:master_song_comment).should eq(master_song_comment)
      end

      it "re-renders the 'edit' template" do
        master_song_comment = MasterSongComment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        MasterSongComment.any_instance.stub(:save).and_return(false)
        put :update, {:id => master_song_comment.to_param, :master_song_comment => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested master_song_comment" do
      master_song_comment = MasterSongComment.create! valid_attributes
      expect {
        delete :destroy, {:id => master_song_comment.to_param}, valid_session
      }.to change(MasterSongComment, :count).by(-1)
    end

    it "redirects to the master_song_comments list" do
      master_song_comment = MasterSongComment.create! valid_attributes
      delete :destroy, {:id => master_song_comment.to_param}, valid_session
      response.should redirect_to(master_song_comments_url)
    end
  end

end
