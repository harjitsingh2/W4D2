class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[:stone, :stone, :stone, :stone]}
    @cups[6] = []
    @cups[13] = []
    @player1_cups = @cups[0..6]
    @player2_cups = @cups[7..13]
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos > 13
      raise "Invalid starting cup"
    end
    if cups[start_pos].empty?
      raise "Starting cup is empty"
    end 
  end

  def make_move(start_pos, current_player_name)
    selected_cup = @cups[start_pos]
    stones = selected_cup.count 
    @cups[start_pos] = []

    # if current_player_name == name1 
    #   (start_pos..13).each do |i|
    #     if @player1_cups.include?(@cups[i])
    #       cups[i] << selected_cup.shift 
    #     end
    #   end
    # end

    # if current_player_name == name2 
    #   (start_pos..13).each do |i|
    #     if @player2_cups.include?(@cups[i])
    #       cups[i] << selected_cup.shift 
    #     end
    #   end
    # end    


  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if (0..5).all? { |idx| cups[idx] = [] } || (7..12).all? { |idx| cups[idx] = [] }
      return true
    else
      return false 
    end
  end

  def winner
    if cups[6].count == cups[13].count
      return :draw 
    end
    if cups[6].count > cups[13].count
      return Player.name1
    else 
      return Player.name2
    end
  end
end