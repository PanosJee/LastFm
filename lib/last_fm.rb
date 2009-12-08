$:.unshift File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'activesupport'
require 'net/http'
require 'digest'
require 'uri'

# The models
require 'last_fm/models/base.rb'
require 'last_fm/models/tag.rb'
require 'last_fm/models/user.rb'
require 'last_fm/models/event.rb'
require 'last_fm/models/chart.rb'
require 'last_fm/models/track.rb'
require 'last_fm/models/artist.rb'
require 'last_fm/models/album.rb'

module LastFm
  
  class << self
    
    def load_configuration(key, secret = nil, prefix = nil)
      @key    = key
      @secret = secret
      @prefix = prefix || "/2.0/?api_key=#{@key}&method="
      return true
    end

    def get_signature(method,params)
      signature = []
      signature << 'method' + method
      params.each_pair do |key,value|
          signature << key.to_s + value
      end 
      signature = signature.sort.join + @secret
      return Digest::MD5.hexdigest(signature)
    end
    
    # fetch lastfm
    def fetch_data(path)
      http       = Net::HTTP.new("ws.audioscrobbler.com",80)
      resp, data = http.get(urlize(@prefix+path+"&api_key="+@key))
      return resp.code == "200" ? data : false	
    end

    def urlize(string)
      return string.gsub(/\ +/, '%20')
    end

    def get_session(token)
      signature = get_signature('auth.getsession',{:api_key => @key, :token => token}) 
      if @session = connect_with_auth('auth.getsession',{ :api_key => @ey, :token => token, :signature => signature })
        session[:lastfm_name] = @session['session']['name']
        session[:lastfm_key]  = @session['session']['key']
      else 
        return false
      end 
    end
    
    #get_lastfm
    def request(method,params,type='hash')
      http = Net::HTTP.new("ws.audioscrobbler.com",80)
      path = @prefix + method
      params.each_pair do |key,value|
        path << "&#{key}=#{value}"
      end
      resp, data = http.get(urlize(path))
      if resp.code == "200"
        if type == 'hash'
          hash = Hash.from_xml(data)['lfm']
          hash.shift
          return hash
        else
          return data
        end
      else 
        return resp.body
      end 
    end
 
    def authenticated_request(method, params,type = 'hash')
      http = Net::HTTP.new("ws.audioscrobbler.com",80)
      path = @prefix + method
      params.each_pair do |key,value|
        path << "&#{key}=#{value}"
      end
      path << '&api_sig=' + get_signature(method,params)
      resp, data = http.get(urlize(path))
      if resp.code == "200"
        if type == 'hash'
          hash = Hash.from_xml(data)['lfm']
          hash.shift
          return hash
        else 
          return data
        end 
      else 
        return false
      end
    end

    def post(method,posted)
      posted[:api_key] = @key
      posted[:sk]      = session[:lastfm_key]
      signature        = get_signature(method,posted)
      posted[:api_sig] = get_signature(method,posted)
      posted[:method]  = method
      resp = Net::HTTP.post_form(URI.parse('http://ws.audioscrobbler.com/2.0/'),posted)
      case resp
        when Net::HTTPSuccess, Net::HTTPRedirection
          return true
        else
          return false
      end
    end

  end

end