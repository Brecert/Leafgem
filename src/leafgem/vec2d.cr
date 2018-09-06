class Vec2D
  property x : Float | Int | Double
  property y : Float | Int | Double

  def self(x, y)
    self.new(x, y)
  end

  def initialize(@x, @y); end

  def relative
    # calculate relative based on layer or something
    self
  end

  def absolute
    # absolute
    self
  end
end
