class HomeController < ApplicationController
  def self.maps
    [
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
    @randomMaps = HomeController.maps.sample(3)
  end

  def rules
    @title = 'The Rules'
  end

end
