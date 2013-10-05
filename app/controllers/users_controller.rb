class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
  end

  def likes
    @user = User.find(params[:user_id])

    arr = Array.new
    Dream.all.each do |dream|
      if @user.voted_for?(dream)
        arr.push(dream)
      end
    end
    redirect_to dreams_path(arr)
  end
end
