require "./hitbox"

class Leafgem::Object
  property position : Vec2f = Vec2f.new(0, 0)
  property size : Vec2 = Vec2.new(0, 0)
  property hitbox = Hitbox.new(Vec2.new(0, 0), Vec2.new(0, 0))

  def init; end

  def update; end

  def draw; end
end
