class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = current_user.games.build
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = current_user.games.build(game_params)
    if @game.save
      redirect_to @game, notice: 'Game was successfully created.' 
    else
      render new
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.' 
    else
      render edit
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    redirect_to games_url 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find_by(id: params[:id])
    end

    def correct_user
      @game = current_user.games.find_by(id: params[:id])
      redirect_to games_path, notice: "Not authorized to edit this game" if @game.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:description, :image, :sport, :level, :location, :price, :players, :daytime)
    end
end
