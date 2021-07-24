class InactivePlayers
  def initialize(club:, season: Season.last)
    @club = club
    @season = season
  end

  def call
    active_club_players.reject { |p| playing_in_season_players_ids.include?(p.id)}
  end

  private

  def active_club_players
    @active_club_players ||= @club.active_players
  end

  def playing_in_season_players_ids
    @playing_in_season_players_ids ||= @club.players_in_season(@season).collect(&:id)
  end
end
