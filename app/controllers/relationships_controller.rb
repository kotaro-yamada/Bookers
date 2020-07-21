class RelationshipsController < ApplicationController
	before_action :set_user, only: [:create, :destroy]

	def create	
		following = current_user.follow(@user)
		following.save
		path = Rails.application.routes.recognize_path(request.referer)
        redirect_to path
	end

	def destroy
		following = current_user.unfollow(@user)
		following.destroy
		path = Rails.application.routes.recognize_path(request.referer)
        redirect_to path
	end

	private
	def set_user
	  @user = User.find(params[:relationship][:follow_id])	
	end
end
