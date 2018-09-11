struct Vec2New(T)
  property x : T
  property y : T

  # Initialize a Vector in a more simple manner
  macro [](x, y)
    Vec2(typeof({{x}})).new({{x}}, {{y}})
  end

  def initialize(@x, @y); end

  {% for name in %w(* + / - %) %}

    # Apply {{name.id}} to the Vector
    def {{name.id}}(other)
      self.class(T).new(@x {{name.id}} other, @y {{name.id}} other)
    end

    # Apply {{name.id}} with the other Vector
    def {{name.id}}(other : Vec2)
      x1 = @x {{name.id}} other.x
      y1 = @y {{name.id}} other.y

      self.class(T).new(x1, y1)
    end

  {% end %}

  # Returns self formatted as a string
  #
  # ```
  # vec = Vec2[33, 24]
  # vec.to_s => "x: 33, y: 24"
  # ```
  def to_s
    "x: #{@x}, y: #{@y}"
  end

  {% for name, type in {
                         to_i: Int32, to_u: UInt32, to_f: Float64,
                         to_i8: Int8, to_i16: Int16, to_i32: Int32, to_i64: Int64, to_i128: Int128,
                         to_u8: UInt8, to_u16: UInt16, to_u32: UInt32, to_u64: UInt64, to_u128: UInt128,
                         to_f32: Float32, to_f64: Float64,
                       } %}

    # Returns `self` converted to `Vec2({{type}})`.
    def {{name.id}} : Vec2({{type}})
      Vec2({{type}}).new(@x.{{name.id}}, @y.{{name.id}})
    end
  {% end %}

  # Relative to a scale and an offset
  def relative_to(scale, offset)
    (self / scale) - offset
  end

  # Relative to a scale
  def relative_to_scale(scale)
    self / scale
  end

  # Relative to an offset
  def relative_to_offset(offset : Vec2)
    self - offset
  end
end

# Base Vec Class
# Should be used for other 2D vectors
abstract class Vec
  {% for name in %w(* + / - %) %}

    # Apply {{name.id}} to the Vector
    def {{name.id}}(amount)
      self.class.new(@x * amount, @y * amount)
    end

    # Apply {{name.id}} with the other Vector
    def {{name.id}}(other : Vec)
      x1 = @x {{name.id}} other.x
      y1 = @y {{name.id}} other.y

      self.class.new(x1, y1)
    end

  {% end %}

  # NOTE: Returns a Vec2f because it can be .to_i, this is for consistency
  def to_relative
    rel_x = 0
    rel_y = 0
    if (lgr = Leafgem::Renderer.renderer)
      rel_x = (@x/lgr.scale[0] - Leafgem::Renderer.offset.x)/Leafgem::Renderer.scale || 0
      rel_y = (@y/lgr.scale[0] - Leafgem::Renderer.offset.y)/Leafgem::Renderer.scale || 0
    end
    self.class.new(rel_x, rel_y)
  end
end

class Vec2 < Vec
  property x : Int32
  property y : Int32

  def initialize(@x, @y); end

  def initialize(x, y)
    @x = x.to_i
    @y = y.to_i
  end

  def to_f
    Vec2f.new @x.to_f, @y.to_f
  end
end

class Vec2f < Vec
  property x : Float64
  property y : Float64

  def initialize(@x, @y); end

  def initialize(x, y)
    @x = x.to_f64
    @y = y.to_f64
  end

  def to_i
    Vec2.new @x.to_i, @y.to_i
  end
end
