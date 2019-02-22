require_relative 'ui'

def play(name)
  map = read_map(2)
  while true
    draw_map(map)
    direction = ask_direction
    hero = find_player map
    new_position = move_player hero, direction
    if !valid_position? map, new_position
      next
    end
    map[hero[0]][hero[1]] = " "
    map[new_position[0]][new_position[1]] = "H"
    move_ghosts map
  end
end

def move_ghosts(map)
  ghost_char = "F"
  map.each_with_index do |current_line, line|
    current_line.chars.each_with_index do |current_char, column|
      is_ghost = current_char == ghost_char
      if is_ghost
        move_ghost map, line, column
      end
    end
  end
end

def move_ghost(map, line, column)
  position = [line, column + 1]
  if valid_position? map, position
    map[line][column] = " "
    map[position[0]][position[1]] =  "F"
  end
end

def init_escape
  name = welcome
  play(name)
end

def read_map(map_number)
  file = "map#{map_number}.txt"
  text = File.read(file)
  map = text.split("\n")
end

def find_player(map)
  hero_char = "H"
  map.each_with_index do |current_line, line|
    hero_column = current_line.index hero_char
    if hero_column
      return [line, hero_column]
    end
  end
  # not found
end

def move_player(player, direction)
  player = player.dup
  movements = { "w" => [-1, 0], "s" => [+1, 0], "a" => [0, -1], "d" => [0, +1] }
  move = movements[direction.downcase]
  player[0] += move[0]
  player[1] += move[1]
  player
end

def valid_position?(map, position)

  lines = map.size
  columns = map[0].size

  invalid_lines = position[0] < 0 || position[0] >= lines
  invalid_columns = position[1] < 0 || position[1] >= columns

  if invalid_lines || invalid_columns
    return false
  end

  pos = map[position[0]][position[1]]
  if pos == "*" || pos == "F"
    return false
  end

  true

end