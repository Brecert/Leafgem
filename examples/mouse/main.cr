require "../../src/leafgem"
include Leafgem::Library

class Draggable < Leafgem::Shapes::Rectangle
  def initialize
    super
    @drag_offset = Vec2(Float64).new(0.0, 0.0)
    @fill_colour = {33, 33, 33, 255}
  end

  def init
    @pos.x = 32
    @pos.y = 32
    @size.x = 32
    @size.y = 32
  end

  def drag_handler
    # If Mouse.primary exists (and thus is active)
    if primary = Mouse.primary
      p = Mouse.pos.relative_to_world.to_f
      debug hitbox.point_in? p
      if hitbox.point_in?(p) && @dragging
        Mouse.cursor = "pointer"
      end

      # If it's been held
      if primary.held? && @dragging
        @fill_colour = {127, 33, 33, 255}

        # Get the positions
        # Set self to mouse poition
        @pos = @drag_offset + p
        # If it's the first tap
      elsif primary.pressed?
        # If click starts out in self
        # So the rect of logic won't trigger if you move the mouse over it
        @dragging = true if hitbox.point_in? p

        # Offsets so it stays relatively positioned to where you clicked
        @drag_offset = @pos - Mouse.pos
      end
      # Update primary click
      # primary.update
    else
      @fill_colour = {33, 33, 33, 255}
      @dragging = false
      Mouse.cursor = nil
    end
  end

  def update
    debug Mouse.scroll.direction
    @size += Mouse.scroll.direction.y

    drag_handler
  end

  def draw
    # note that the "draw" color is always white until set otherwise
    set_draw_color(@fill_colour)
    draw_self
  end
end

set_window("Leafgem Mouse Example!", 560, 400, 1)
create_object(Draggable, 0, 0)

Leafgem::Game.run
