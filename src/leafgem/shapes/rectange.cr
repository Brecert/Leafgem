module Leafgem
  class Rect < Hitbox

    def calculate_bounds
      # (math for rect)
      self
    end
    
    # Maybe?
    def in_bounds?(rect : Rect)
      # (math for interacting with other rect)
    end
    
    # Maybe?
    def in_bounds?(eclipse : Eclipse)
      # (math for interacting with other rect)
    end
    
    def draw
      # math for drawing rect
      # draw_rect(@position.x, @positition.y, @width, @height)
  end
end