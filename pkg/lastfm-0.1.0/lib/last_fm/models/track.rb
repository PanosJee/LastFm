module LastFm
  class Track < Base
    
    def initialize(artist,name)
      super(name)
      @attributes = self.info(artist) if @attributes == {} and !artist.blank?
      _process_attributes
    end
    
     def info(artist, options = {})
       params = ""
       options.each_pair { |key,value| params += "&#{key}=#{value}" }
       lfm_path = "track.getinfo&artist=#{artist}&track=#{@name}#{params}"
       lfm_data = LastFm::fetch_data(lfm_path)
       return Hash.from_xml(lfm_data)['lfm']['track']
     end
     
     def self.search(artist,track)
       self.new(artist,track)
     end
     
     private
     
     def _process_attributes; end
    
  end
end