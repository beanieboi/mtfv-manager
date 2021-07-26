class NextPlayerNumber
  PREFIX = {
    sachsen: "12",
    thueringen: "15",
    sachsenanhalt: "13",
  }

  def initialize(state:)
    @state = state
  end

  def call
    if !Player.where(spielernr: next_player_number).exists?
      puts next_player_number
    else
      puts "error calculating next number"
    end
  end

  private

  def players_in_state
    Player.where("spielernr LIKE \"#{prefix}%\"")
  end

  def next_player_number
    _, player = last_player_number.split("-")
    # remove leading 0
    player = player.sub(/^[0]+/,' ')
    player = Integer(player)
    player = player+1
    player = "%04d" % player
    [prefix, player].join("-")
  end

  def last_player_number
    players_in_state.collect(&:spielernr).sort.max
  end

  def prefix
    PREFIX.fetch(@state)
  end
end
