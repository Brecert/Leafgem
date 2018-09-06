module Leafgem
  class GameObject < LeafObject
    property position : Vec2D
    property width : Float
    property height : Float

    def initialize(@position, @width, @height); end
  end
end
