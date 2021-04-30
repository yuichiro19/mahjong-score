class ScoresController < ApplicationController
  before_action :set_game
  before_action :set_scores, only: [:index, :show]
  before_action :authenticate_user!

  def index
    @score = Score.new
  end

  def create
    point_calc
    @score = Score.create(score_params)
    if @score.save
      redirect_to game_scores_path
    else
      render :index
    end
  end

  def show
  end

  def destroy
    score = Score.find(params[:id])
    score.destroy
    redirect_to game_scores_path
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_scores
    @scores = @game.scores.includes(:game)
  end

  def score_params
    params.require(:score).permit(:user_score, :guest1_score, :guest2_score, :guest3_score, :user_rank, :guest1_rank, :guest2_rank, :guest3_rank, :user_point, :guest1_point, :guest2_point, :guest3_point).merge(
      user_id: current_user.id, game_id: params[:game_id]
    )
  end

  def point_calc
    if params[:score][:user_rank] == '1'
      params[:score][:guest1_point] = player_point_calc(params[:score][:guest1_score], params[:score][:guest1_rank])
      params[:score][:guest2_point] = player_point_calc(params[:score][:guest2_score], params[:score][:guest2_rank])
      params[:score][:guest3_point] = player_point_calc(params[:score][:guest3_score], params[:score][:guest3_rank])
      params[:score][:user_point] =
        -(params[:score][:guest1_point] + params[:score][:guest2_point] + params[:score][:guest3_point])
    elsif params[:score][:guest1_rank] == '1'
      params[:score][:user_point] = player_point_calc(params[:score][:user_score], params[:score][:user_rank])
      params[:score][:guest2_point] = player_point_calc(params[:score][:guest2_score], params[:score][:guest2_rank])
      params[:score][:guest3_point] = player_point_calc(params[:score][:guest3_score], params[:score][:guest3_rank])
      params[:score][:guest1_point] =
        -(params[:score][:user_point] + params[:score][:guest2_point] + params[:score][:guest3_point])
    elsif params[:score][:guest2_rank] == '1'
      params[:score][:user_point] = player_point_calc(params[:score][:user_score], params[:score][:user_rank])
      params[:score][:guest1_point] = player_point_calc(params[:score][:guest1_score], params[:score][:guest1_rank])
      params[:score][:guest3_point] = player_point_calc(params[:score][:guest3_score], params[:score][:guest3_rank])
      params[:score][:guest2_point] =
        -(params[:score][:user_point] + params[:score][:guest1_point] + params[:score][:guest3_point])
    else
      params[:score][:user_point] = player_point_calc(params[:score][:user_score], params[:score][:user_rank])
      params[:score][:guest1_point] = player_point_calc(params[:score][:guest1_score], params[:score][:guest1_rank])
      params[:score][:guest2_point] = player_point_calc(params[:score][:guest2_score], params[:score][:guest2_rank])
      params[:score][:guest3_point] =
        -(params[:score][:user_point] + params[:score][:guest1_point] + params[:score][:guest2_point])
    end
  end

  def player_point_calc(score, rank)
    base_point = ((score.to_i - 100).round(-3) - @game.top_bonus.basic) / 1000
    if rank == '2'
      base_point + @game.rank_bonus.second_bonus
    elsif rank == '3'
      base_point + @game.rank_bonus.third_bonus
    else
      base_point + @game.rank_bonus.forth_bonus
    end
  end
end
