class Champion < ActiveRecord::Base
  validates :name, presence: true,
    length: { minimum: 3 }
  validates :division, presence: true,
    length: { minimum: 5 }
  validates :defended, presence: true

  class << self
    # Does a case insensitive by division
    # @param division [String] The division to search by
    # @return [ActiveRecord::Relation]
    #
    def by_division(division)
      where("LOWER(division) = ?", (division || '').downcase)
    end
  end
end
