class GamesController < ApplicationController
  
  def index
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_scores_path(@game.id)
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:guest1, :guest2, :guest3, :rank_bonus_id, :top_bonus_id, :rate_id, :chip ).merge(user_id: current_user.id)
  end

end
