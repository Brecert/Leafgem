class Leafgem::Shapes::Rectangle < Leafgem::GameObject
  property fill = true
  property outline = false
  property hitbox = Hitbox.new(@position.to_i, @size)
  property fill_color = {0, 0, 0, 255}
  property outline_color = {0, 0, 0, 255}
  property outline_width = 1

  def update_hitbox
    @hitbox.position = @position.to_i
    @hitbox.size = @size
  end

  def update
  end

  def self.draw(position : Vec, size : Vec, fill, outline, outline_width, fill_color, outline_color)
    if (renderer = Leafgem::Renderer.renderer)
      position = position.to_i

      rect = SDL::Rect.new(position.x, position.y, size.x, size.y)
      set_draw_color fill_color
      renderer.fill_rect(rect) if fill
      set_draw_color outline_color
      if outline
        outline_width.times do |i|
          rect.x -= 1 if i.even?
          rect.y -= 1 if i.even?
          rect.w += 1
          rect.h += 1
          renderer.draw_rect(rect)
        end
      end
    end
  end

  def draw_self(position = @position, size = @size, fill = @fill, outline = @outline, outline_width = @outline_width, fill_color = @fill_color, outline_color = @outline_color)
    self.class.draw(position, size, fill, outline, outline_width, fill_color, outline_color)
  end
end
