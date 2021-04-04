class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @scores = @user.scores
    @user_ranks = []
    @scores.each do |rank|
      @user_ranks << rank[:user_rank]
    end
  end
end
