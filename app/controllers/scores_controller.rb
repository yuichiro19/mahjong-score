class ScoresController < ApplicationController
    def new
        @score = Score.new
        @game = Game.find(params[:game_id])
    end

    def create
        Score.create(score_params)
        redirect_to new
    end

    private 
    def score_params
        params.require(:score).permit(:user_score, :guest1_score, :guest2_score, :guest3_score, :user_rank_id, :guest1_rank_id, :guest2_rank_id, :guest3_rank_id, :user_point, :guest1_point, :guest2_point, :guest3_point).merge(user_id: current_user.id, game_id: params[:@game_id])
    end

end
