class ScoresController < ApplicationController
    def new
        @score = Score.new
        @game = Game.find(params[:game_id])
    end

    def create
    end

end
