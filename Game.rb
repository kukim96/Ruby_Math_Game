class Game
  def initialize
    @player_1 = Player.new(1)
    @player_2 = Player.new(2)
    @current_player = @player_1
  end

  def begin_game
    puts "Welcome to TwO-O-Player Math Game!"
    puts "Each player starts with 3 lives"
    puts "When a question is answered incorrectly, \n that player loses a life"
    puts "When one of the player is out of lives\n the game is finished."
    puts "When you are ready to begin, type 'start' in the prompt"
    ask_to_begin
  end

  def ask_to_begin
    (1..2).each do |id|
      puts "\nPlayer #{id}: Ready to start?"
      print "> "
      answer = gets.chomp

      while (answer != "start")
        puts "Please type 'start' to start."
        prints "> "
        answer = gets.chomp
      end
    end
    puts "Let the Math Game begin!"
    next_turn
  end

  def next_turn
    turn = Turn.new(@current_player.id)
    player_answer = turn.ask_question

    if (player_answer == false)
      @current_player.lose_life
    end
    
    show_scores

    if (@current_player.current_lives == 0)
      end_game
    else
      switch_player
      puts "New Turn"
      next_turn
    end
  end

  def switch_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

  def show_scores
    puts "P1: #{@player_1.current_lives}/3 vs P2: #{@player_2.current_lives}/3"
  end

  def end_game
    puts "Player #{@current_player.id} is out of lives!"
    switch_player

    puts "player #{@current_player.id} wins with a score of #{@current_player.current_lives}/3"

    puts "Game Over"
    exit(0)
  end
end
