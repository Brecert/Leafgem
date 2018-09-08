require "../../src/leafgem"
include Leafgem::Library

# class Chip < Leafgem::Shapes::Rectangle
#   def initialize
#     super
#     @offset_x = 0_f64
#     @offset_y = 0_f64
#     @fill_colour = {33, 33, 33, 255}
#   end

#   def update
#     update_hitbox
#   end

#   def draw
#     set_draw_color(@fill_colour)
#     draw_self
#   end
# end

class Chip < Leafgem::GameObject
  def initialize
    @position.x = 32
    @position.y = 32
    @size.x = 32
    @size.y = 32

    @hitbox.position = Vec2.new(0, 0)
    @hitbox.size = @size

    @rectangle = Leafgem::Shapes::Rectangle.new
    @rectangle.position = @position
    @rectangle.size = @size
    @rectangle.fill = true
    @rectangle.outline = true
    @rectangle.outline_width = 5
    @rectangle.fill_color = {155, 222, 155, 255}
    @rectangle.outline_color = {155, 155, 155, 255}

    @dragging = false
  end

  def update
    pos = Mouse.position.to_f
    debug "mouse   : #{Mouse.position.to_s}"
    debug "pressed?: #{@hitbox.pressed?}"
    debug "dragging: #{@dragging}"
    debug "position: #{@hitbox.position.to_relative.to_s}"
    debug "point_in: #{@hitbox.point_in? pos}"

    if @hitbox.pressed?
      @dragging = true
    end

    if p = Mouse.primary?
      if p.held? && @dragging
        @position = pos
      end
    else
      @dragging = false
    end

    debug @position

    @rectangle.position = @position
    @rectangle.size = @size
  end

  def draw
    @rectangle.position = @rectangle.position
    @rectangle.draw
  end
end

set_window("Leafgem Mouse Example!", 560, 400, 1)
debug_show_hitboxes(true)

create_object(Chip, 0, 0)

Leafgem::Game.run
