<p align="center">
	<img src="https://i.imgur.com/Y3glMNk.png">
</p>

## Description

Leafgem is the humble beginning of a 2D open source game engine written in Crystal!

## Try it out with the demo project!
```
git clone https://github.com/tfcat/Leafgem.git
cd Leafgem
shards install
crystal run -s -p demo/main.cr
```

## notes to self
flare map files

## Development

What are the main things we need for a Game Engine? Here's what I can think of off the top of my head.
Each of the given features *could* be contained in a class which correlates to their purpose.

**Documentation**
- [ ] Library / API reference for users
- [ ] Simple text tutorial / demo walkthrough?
- [ ] In-depth class reference for developers?
- [ ] Video tutorials????
- [ ] DEMO GAME (learning Leafgem by example)

**Control**
- [x] Keypressing - *on_press*, *on_release* and *is_pressed*

**Objects**
- [x] Instance-based system. (Unique, contained object instances, derived from a template [class])
- [x] Destroying objects (self, and foreign)
- [x] Object selection (e.g. setting attributes of foreign objects )
- [x] Box collision detection
    - [ ] Hit box definition, independent of sprite
- [ ] Per-pixel collision detection

**Sprites**
- [x] Sprite animations + Breaking sprites up into sub-images
- [ ] Text rendering (TTF?)

**Audio**
- [x] Oneshots
- [x] Looping background music
- [x] Audio fade in/out over time
- [x] Multiple sound samples playing at once (the same sample cannot be played on top of itself)

**Maps/Rooms**
- [x] Background renderer
	- [x] Parallax scrolling!
- [ ] Foreground renderer
- [x] Tileset renderer
    - [ ] Tile layers
- [x] "Rooms"
	- [ ] Spawn objects in predetermined places
- [ ] Easier workflow regarding room creation... should I make an IDE?

## Known bugs
- Going above the tilemap results in an invisible duplication of the map, according to the logic in `get_tile_at` within `maps.cr`. This results in unexpected `true` returns with some object functions; `meeting_tile` and `meeting_tile_layer`

## Contributing 

I'm not all that good with Crystal - I'm creating this project as practice using the Crystal language! 

That means any and all contributions to this engine are welcome and heavily appreciated, no matter how big or small. The aim is to give creators an intuitive toolkit for making games quickly and easily!

Any ideas are welcome!
Fork, and work your magic!

## Contributors

- [tfcat](https://github.com/tfcat) - creator, maintainer, designer
- [rx14](https://github.com/rx14) - mentor, sensei, tech support, emotional support