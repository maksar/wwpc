class ChampionsController < ApplicationController
  def index
    @title = 'Champions'
    @champions = Champion.all
  end

  def division
    division = params.fetch(:division, '')
    @division_board = ChampionsByDivisionBoard.new(division)
    @title = division.capitalize + ' - Division'
  end

  def edit
    @title = 'Edit champion'
    @champion = Champion.find(params[:id])
  end

  def update
    @champion = Champion.find(params[:id])

    if @champion.update(champion_params)
      redirect_to @champion
    else
      render 'index'
    end
  end

  def destroy
    @champion = Champion.find(params[:id])
    @champion.destroy

    redirect_to 'index'
  end

  def new
    @title = 'Add champion'
    @champion = Champion.new
  end

  def create
    @champion = Champion.new(champion_params)

    if @champion.save
      redirect_to @champion
    else
      render 'index'
    end
  end

  def show
    @champion = Champion.find(params[:id])
  end

  private

  def champion_params
    params.require(:champion).permit(:name, :division, :defended)
  end
end

# Helper object for displaying the champions by division
class ChampionsByDivisionBoard
  attr_reader :division, :champions

  def initialize(division)
    @division   = division.upcase
    @champions  = Champion.by_division(division)
  end
end
