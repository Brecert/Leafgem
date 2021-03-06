# This is just the code to show the fading title!
class Scene_manager < Leafgem::Objects::Game
  @titlefade = 0.0
  @titleswitch = false
  @title_sprite : SDL::Surface?

  def init
    @title_sprite = sprite("examples/demo/images/title.png")
  end

  def update
    if (@titleswitch)
      @titlefade = Math.max(@titlefade - 3, 0).to_f
    else
      @titlefade = Math.min(@titlefade + 3, 255).to_f
    end
    if (get(Player).size > 0 && get(Player)[0].pos.x > 150)
      @titleswitch = true
    end
  end

  def draw
    if (sprite = @title_sprite)
      draw_sprite(sprite, (screen_width - sprite.width)/2, 50, @titlefade, 1, 1, true)
    end
  end
end
