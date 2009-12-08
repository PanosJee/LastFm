module LastFm
  class User < Base
    
    def initialize(name)
      super(name)
    end
    
    def weekly_album_chart
      lfm_path = "user.weeklyalbumchart&user=#{@name}"
      lfm_data = LastFm::fetch_data(lfm_path)
      return Album.create_from_hash(Hash.from_xml(lfm_data)['lfm']['weeklyalbumchart']['album'])
    end
    
    def top_albums
      lfm_path = "user.gettopalbums&user=#{@name}"
      lfm_data = LastFm::fetch_data(lfm_path)
      return Album.create_from_hash(Hash.from_xml(lfm_data)['lfm']['topalbums']['album'])
    end
    
    
    def weekly_artists_chart
      lfm_path = "user.getweeklyartistchart&user=#{@name}"
      lfm_data = LastFm::fetch_data(lfm_path)
      return Artist.create_from_hash(Hash.from_xml(lfm_data)['lfm']['weeklyartistchart']['artist'])
    end
    
    def top_artists
      lfm_path = "user.gettopartists&user=#{@name}"
      lfm_data = LastFm::fetch_data(lfm_path)
      return Artist.create_from_hash(Hash.from_xml(lfm_data)['lfm']['topartists']['artist'])
    end
    
  end
end