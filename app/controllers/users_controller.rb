class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @scores = @user.scores
    end

    private
    def ave_scores(key)
        @scores.sum{|hash| hash[key]}.fdiv(@scores.length).round(2)
    end
end