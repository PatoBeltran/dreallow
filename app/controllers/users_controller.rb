class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def likes

    @user = current_user

    arr = Array.new
    Dream.all.each do |dream|
      if @user.voted_for?(dream)
        arr.push(dream)
      end
    end


    #TODO
    #necesita redirijir solo sus likes
    redirect_to dreams_path
  end
end
