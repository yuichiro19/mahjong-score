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
      guest1_point_calc
      guest2_point_calc
      guest3_point_calc
      params[:score][:user_point] =
        -(params[:score][:guest1_point] + params[:score][:guest2_point] + params[:score][:guest3_point])
    elsif params[:score][:guest1_rank] == '1'
      user_point_calc
      guest2_point_calc
      guest3_point_calc
      params[:score][:guest1_point] =
        -(params[:score][:user_point] + params[:score][:guest2_point] + params[:score][:guest3_point])
    elsif params[:score][:guest2_rank] == '1'
      user_point_calc
      guest1_point_calc
      guest3_point_calc
      params[:score][:guest2_point] =
        -(params[:score][:user_point] + params[:score][:guest1_point] + params[:score][:guest3_point])
    else
      user_point_calc
      guest1_point_calc
      guest2_point_calc
      params[:score][:guest3_point] =
        -(params[:score][:user_point] + params[:score][:guest1_point] + params[:score][:guest2_point])
    end
  end

  def user_point_calc
    user_base_point = ((params[:score][:user_score].to_i - 100).round(-3) - @game.top_bonus.basic) / 1000
    params[:score][:user_point] = if params[:score][:user_rank] == '2'
                                    user_base_point + @game.rank_bonus.second_bonus
                                  elsif params[:score][:user_rank] == '3'
                                    user_base_point + @game.rank_bonus.third_bonus
                                  else
                                    user_base_point + @game.rank_bonus.forth_bonus
                                  end
  end

  def guest1_point_calc
    guest1_base_point = ((params[:score][:guest1_score].to_i - 100).round(-3) - @game.top_bonus.basic) / 1000
    params[:score][:guest1_point] = if params[:score][:guest1_rank] == '2'
                                      guest1_base_point + @game.rank_bonus.second_bonus
                                    elsif params[:score][:guest1_rank] == '3'
                                      guest1_base_point + @game.rank_bonus.third_bonus
                                    else
                                      guest1_base_point + @game.rank_bonus.forth_bonus
                                    end
  end

  def guest2_point_calc
    guest2_base_point = ((params[:score][:guest2_score].to_i - 100).round(-3) - @game.top_bonus.basic) / 1000
    params[:score][:guest2_point] = if params[:score][:guest2_rank] == '2'
                                      guest2_base_point + @game.rank_bonus.second_bonus
                                    elsif params[:score][:guest2_rank] == '3'
                                      guest2_base_point + @game.rank_bonus.third_bonus
                                    else
                                      guest2_base_point + @game.rank_bonus.forth_bonus
                                    end
  end

  def guest3_point_calc
    guest3_base_point = ((params[:score][:guest3_score].to_i - 100).round(-3) - @game.top_bonus.basic) / 1000
    params[:score][:guest3_point] = if params[:score][:guest3_rank] == '2'
                                      guest3_base_point + @game.rank_bonus.second_bonus
                                    elsif params[:score][:guest3_rank] == '3'
                                      guest3_base_point + @game.rank_bonus.third_bonus
                                    else
                                      guest3_base_point + @game.rank_bonus.forth_bonus
                                    end
  end
end
