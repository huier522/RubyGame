print "玩家請出拳，只能輸入以下其中一項：scissor, rock, paper："
player = gets.chomp # 玩家可輸入 scissor, rock, paper
game = ["scissor", "rock", "paper"] # 給電腦一個名為 game 的 scissor, rock, paper 陣列
com = game[rand(3)] # game[0] = scissor, game[1] = rock, game[2] = paper
print "電腦：#{com}"

if (player == "scissor" && com == "paper") || (player == "rock" && com == "scissor") || (player == "paper" && com == "rock")
  result = "Player wins（玩家勝利）"
elsif (com == "scissor" && player == "paper") || (com == "rock" && player == "scissor") || (com == "paper" && player == "rock")
  result = "Computer wins（電腦勝利）"
else
  result = "Tie（平手）"
end

puts "\n#{result}!!!"

  