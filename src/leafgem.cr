# ======================== #
#         SDL2 DEPS        #
# ======================== #
require "sdl"
require "sdl/image"
require "sdl/mix"

# SDL.init(SDL::Init::VIDEO | SDL::Init::AUDIO); at_exit { SDL.quit }
# SDL::IMG.init(SDL::IMG::Init::PNG); at_exit { SDL::IMG.quit }
# SDL::Mix.open

# This API is failed for now

# ======================== #
#      LEAFGEM MODULE      #
# ======================== #
require "./leafgem/**"
