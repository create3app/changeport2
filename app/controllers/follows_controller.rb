class FollowsController < ApplicationController

    def create
        set_user
        current_user.followee_users.build(followee_id: @user.id).save!
        flash[:success] = "You have successfully followed user #{@user.name}."
        redirect_to user_url(current_user)
    end

    def destroy
        set_user
        current_user.followees.delete(@user)
        flash[:success] = "You have sucessfully removed #{@user.name} from your follow list."
        redirect_to user_url(current_user)
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end
end