module LastFm
  class Artist < Base
    
    def initialize(name)
      super(name)
      @attributes = self.info if @attributes == {}
    end
    
    def info
      lfm_path = "artist.getinfo&artist=#{@name}"
      lfm_data = LastFm::fetch_data(lfm_path)
      return Hash.from_xml(lfm_data)['lfm']['artist']
    end
    
    # Work on tag object
    def top_tags
      lfm_path = "artist.getTopTags&artist=#{@name}"
      lfm_data = LastFm::fetch_data(lfm_path)
      return  Tag.create_from_hash(Hash.from_xml(lfm_data)['lfm']['toptags']['tag']) 
    end
    
    # Work on event object
    def events
      lfm_path = "artist.getevents&artist=#{@name}"
      lfm_data = LastFm::fetch_data(lfm_path)
      return Event.create_from_hash(Hash.from_xml(lfm_data)['lfm']['events']['event'])  
    end
    
    def similar(limit = 7)
      lfm_path = "artist.getsimilar&artist=#{@name}&limit=#{limit}"
      lfm_data = LastFm::fetch_data(lfm_path)   
      return Event.create_from_hash(Hash.from_xml(lfm_data)['lfm']['similarartists']['artist'])   
    end
    
    # Work on album object
    def top_albums       
      lfm_path = "artist.topAlbums&artist=#{@name}"
      lfm_data = LastFm::fetch_data(lfm_path)
      return Album.create_from_hash(Hash.from_xml(lfm_data)['lfm']['topalbums']['album'])
    end
    
    # work on track object
    def top_tracks
      lfm_path = "artist.topTracks&artist=#{@name}"
      lfm_data = LastFm::fetch_data(lfm_path)
      return Track.create_from_hash(Hash.from_xml(lfm_data)['lfm']['toptracks']['track'])
    end
    
    def track(track_name)
      Track.search(@name, track_name)
    end
    
    def album(album_name)
      Album.search(@name, album_name)
    end
    
  end
end
