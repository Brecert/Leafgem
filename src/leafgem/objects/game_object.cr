require "./drawn_object"

class Leafgem::GameObject < Leafgem::DrawnObject
  def set_hitbox(x, y, w, h)
    self.hitbox.set(x, y, w, h)
  end

  def meeting?(x, y, foreign_object)
    # basic box collision
    # check each corner of self with every corner of every instance of the foreign object
    if (typeof(foreign_object) == Class || String)
      objs = Leafgem::Game.loop[foreign_object.to_s]
    else
      objs = foreign_object
    end
    if (objects_to_check = objs.as(Array(Leafgem::Object)))
      objects_to_check.each do |other|
        if (box_collision_check(self.hitbox, other.hitbox, x, y))
          return true
        end
      end
    end
    return false
  end

  def box_collision_check(this, other, x, y)
    if this.x + x >= other.x && this.x + x < other.x + other.w && this.y + y >= other.y && this.y + y < other.y + other.h ||
       (this.x + x + this.w) >= other.x && (this.x + x + this.w) < other.x + other.w && this.y + y >= other.y && this.y + y < other.y + other.h ||
       (this.x + x + this.w) >= other.x && (this.x + x + this.w) < other.x + other.w && (this.y + y + this.h) >= other.y && (this.y + y + this.h) < other.y + other.h ||
       this.x + x >= other.x && this.x + x < other.x + other.w && (this.y + y + this.h) >= other.y && (this.y + y + this.h) < other.y + other.h
      return true
    else
      return false
    end
  end

  def meeting_tile?(xoffset, yoffset, tile, accuracy = 2)
    points_to_check = self.get_collision_points(xoffset, yoffset, accuracy)
    points_to_check.each do |point|
      if (Leafgem::Map.get_tile_at(point[0], point[1]) == tile)
        return true
      end
    end
    return false
  end

  def meeting_tile_layer?(xoffset, yoffset, tilelayer, accuracy = 2)
    points_to_check = self.get_collision_points(xoffset, yoffset, accuracy)
    points_to_check.each do |point|
      if (Leafgem::Map.get_tile_at(point[0], point[1], tilelayer) != 0)
        return true
      end
    end
    return false
  end

  def get_collision_points(xoffset, yoffset, accuracy)
    points_to_check = [
      [@position.x + @hitbox.position.x + xoffset, @position.y + @hitbox.position.y + yoffset],
      [@position.x + @hitbox.position.x + xoffset + self.hitbox.size.x, @position.y + @hitbox.position.y + yoffset],
      [@position.x + @hitbox.position.x + xoffset + self.hitbox.size.x, @position.y + @hitbox.position.y + yoffset + self.hitbox.size.y],
      [@position.x + @hitbox.position.x + xoffset, @position.y + @hitbox.position.y + yoffset + self.hitbox.size.y],
    ]
    # insert intermediate points between corners, for better checking
    (accuracy).times do |i|
      points_to_check.push([@position.x + @hitbox.position.x + xoffset + self.hitbox.size.x * 1/accuracy * i, @position.y + @hitbox.position.y + yoffset])
      points_to_check.push([@position.x + @hitbox.position.x + xoffset + self.hitbox.size.x * 1/accuracy * i, @position.y + @hitbox.position.y + yoffset + self.hitbox.size.y])
      points_to_check.push([@position.x + @hitbox.position.x + xoffset, @position.y + @hitbox.position.y + yoffset + self.hitbox.size.y * 1/accuracy * i])
      points_to_check.push([@position.x + @hitbox.position.x + xoffset + self.hitbox.size.x, @position.y + @hitbox.position.y + yoffset + self.hitbox.size.y * 1/accuracy * i])
    end

    return points_to_check
  end
end
