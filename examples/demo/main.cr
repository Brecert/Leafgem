require "../../src/leafgem"
include Leafgem::Library

require "./scene_manager"

class Player < Leafgem::GameObject
  @onground = false

  Anim::Idle = [[0, 1], 0, 0.05]

  def init
    set_spritesheet("examples/demo/images/cat.png", 27, 27)
    set_animation(Anim::Idle)
    set_hitbox(8, 12, 10, 15)
  end

  def update
    @onground = false

    set_camera_x(lerp(camera_x, Math.max(@position.x - 90, 0), 0.05))
  end

  def draw
    draw_self
    set_draw_color(255, 0, 0, 100)
    fill_circ(Mouse.world_position.x, Mouse.world_position.y, 2)
  end
end

set_window("Leafgem Demo!", 560, 400, 2)
debug_show_hitboxes(true)

load_map("examples/demo/map")
create_object(Scene_manager, 0, 0)
create_object(Player, 122, 100)
set_camera_x(32)

Leafgem::Game.run
