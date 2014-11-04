module LastFm
  class Base

    class << self
      def search(name)
        self.new(name)
      end

      def create_from_hash(data)
        if data.class == Array
          models = []
          data.each do |d|
            if d.class == Hash
              name         = (d['name'] || d['title']) || d['id']
              n            = self.new(name) rescue self.new(nil, name)
              n.attributes = d
              models.push(n)
            end
          end
          return models
        else
          name         = (data['name'] || data['title']) || data['id']
          n            = self.new(name)
          n.attributes = data
          return n
        end
      end
    end


    def initialize(name)
      @name       = name
      @attributes = Hash.new
    end

    def name
      @name
    end

    def name=(n)
      @name = n
    end

    def attributes=(h)
      @attributes = h
    end

    def get_xml_attributes(elements)
      h = Hash.new
      elements.each { |e|
        # do somethings about nested and cdata !
        name    = e.name == "image" ? 'image_'+e.attributes['size'] : e.name
        h[name] = e.text
      }
      return h
    end


    def method_missing(sym, *args, &block)
      return @attributes[sym.to_s] if @attributes.has_key?(sym.to_s)
    end

    def methods
      @attributes.keys
    end
  end
end
