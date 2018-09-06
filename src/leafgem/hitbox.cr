module Leafgem
  class Hitbox < GameObject
    # Generate hitbox bounds using math for anything else to
    # check if the hitbox is being hit
    def calculate_bounds : Hitbox
      # (math)
      self
    end

    # Is the point (x, y) in the generated bounds?
    def in_bounds?(x, y) : Bool
      # is x and y in calculate_bounds
    end

    # Is the Vec2D in the generated bounds?
    def in_bounds?(vec : Vec2D) : Bool
      # is vec.x and vec.y in calculate bounds?
    end
  end
end
