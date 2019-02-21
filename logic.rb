require_relative 'ui'

def play(name)
  map = read_map(1)
  while true
    draw_map(map)
    direction = ask_move
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