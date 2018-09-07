class Leafgem::Shapes::Rectangle < Leafgem::GameObject
  property fill = true
  property outline = false
  property hitbox = Hitbox.new(@position.to_i, @size)

  def self.draw(position : Vec, size : Vec, fill = true, outline = false)
    draw_self(position, size)
  end

  def draw_self(position : Vec = @position, size : Vec = @size, fill = @fill, outline = @outline)
    if (renderer = Leafgem::Renderer.renderer)
      position = position.to_i

      rect = SDL::Rect.new(position.x, position.y, size.x, size.y)
      renderer.fill_rect(rect) if fill
      renderer.draw_rect(rect) if outline
    end
  end

  def pressed?
    if primary = Library::Mouse.primary?
      hitbox.point_in?(primary.position) && primary.pressed?
    else
      false
    end
  end
end
