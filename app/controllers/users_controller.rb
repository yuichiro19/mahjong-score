class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @scores = @user.scores
    end

    private
    def ave_scores(a)
        @scores.sum{|hash| hash[a]}.fdiv(@scores.length).round(2)
    end
end