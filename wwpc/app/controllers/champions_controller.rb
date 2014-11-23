class ChampionsController < ApplicationController
  def self.maps
    @@maps = [
      "Badlands",
      "Arctic Refuge",
      "Canis River",
      "Cobalt Valley",
      "Crimson Feud",
      "Emerald Crater",
      "Eye of the Storm",
      "Fields of Isis",
      "Finn's Revenge",
      "Loki",
      "Niflheim Final II",
      "Open Palms",
      "Open Waters",
      "Point of Reach",
      "Regor Vi Highlands",
      "Roanoke Abyss",
      "Saltrock Colony",
      "Standing Stones",
      "Syrtis Major",
      "Theta Passage",
      "Twin Rivers",
      "Vya-3 Protectorate",
      "White Fire"
    ]
  end

	def index
		@title = 'Home'
    @champions = Champion.all
    @randomMaps = ChampionsController.maps.sample(3)
  end

  def division
    division = params.fetch(:division, '')
    @division_board = ChampionsByDivisionBoard.new(division)
  end

  def edit
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
