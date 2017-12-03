def display_board(board)
  puts " #{board[0]}  | #{board[1]}  | #{board[2]}  "
  puts "--------------"
  puts " #{board[3]}  | #{board[4]}  | #{board[5]}  "
  puts "--------------"
  puts " #{board[6]}  | #{board[7]}  | #{board[8]}  "
end

# 驗證玩家輸入的是否正確的方法
def vaild_move?(board,position)
  (0..8).include?(position) && board[position] == " "
end

def play(board, counter)
  puts "選出你要下棋的位置，請請輸入 1-9："
  input = gets.chomp
  position = input.to_i - 1

  if vaild_move?(board,position) == true
    board[position] = current_player(counter)
    display_board(board)
  else
    play(board, counter)
  end
end

def turn(board)
  counter = 1
  while counter <= 9 && !won?(board) do
    puts "第 #{counter} 回合, 輸到 #{current_player(counter)}"
    play(board, counter)
    counter += 1
  end

  if won?(board)
    puts "#{winner(board)} 贏了！"
  else
    puts "平手！"
  end

  puts "遊戲結束！"
end

def current_player(counter)
  if counter % 2 == 0
    return "O"
  else
    return "X"
  end
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  # 如果有滿足到贏的組合，就回傳 True
  WIN_COMBINATIONS.each do |win_combo|
    if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X" ) || (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O" )
      return win_combo
    end
  end

  # 如果都沒人贏，就回傳 False
  return false
end

=begin
def won?(board)
  if (board[0] == "X" && board[1] == "X" && board[2] == "X" ) || (board[0] == "O" && board[1] == "O" && board[2] == "O" )
    return true
  elsif (board[3] == "X" && board[4] == "X" && board[5] == "X" ) || (board[3] == "O" && board[4] == "O" && board[5] == "O" )
    return true
  elsif (board[6] == "X" && board[7] == "X" && board[8] == "X" ) || (board[6] == "O" && board[7] == "O" && board[8] == "O" )
    return true
  elsif (board[0] == "X" && board[3] == "X" && board[6] == "X" ) || (board[0] == "O" && board[3] == "O" && board[6] == "O" )
    return true
  elsif (board[1] == "X" && board[4] == "X" && board[7] == "X" ) || (board[1] == "O" && board[4] == "O" && board[7] == "O" )
    return true
  elsif (board[2] == "X" && board[5] == "X" && board[8] == "X" ) || (board[2] == "O" && board[5] == "O" && board[8] == "O" )
    return true
  elsif (board[1] == "X" && board[4] == "X" && board[8] == "X" ) || (board[1] == "O" && board[4] == "O" && board[8] == "O" )
    return true
  elsif (board[2] == "X" && board[4] == "X" && board[6] == "X" ) || (board[2] == "O" && board[4] == "O" && board[6] == "O" )
    return true
  end

  return false
end
=end

def winner(board)
  win_combo = won?(board)
  if win_combo
    winner = board[win_combo[0]]
    return winner
  end
end

###################################################
# 執行程序

puts "你開啟了一局新的井字遊戲！"
puts "請以 1-9 數字對應棋盤位置"
display_board([1,2,3,4,5,6,7,8,9])

board = Array.new(9, " ")
turn(board)