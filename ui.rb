def welcome
  puts "\nWelcome to Escape game... Tell me you name?\n"
  nome = gets.strip
  puts "\n\n"
  puts "Get ready #{nome}, the game's about to start!\n\n\n"
  nome
end

def ask_move
  puts "\n\nWhere do you wanna go?\n"
  move = gets.strip
end

def draw_map(map)
  puts map
end