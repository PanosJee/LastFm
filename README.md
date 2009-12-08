# LastFm

This library provides some a Ruby interface to interact with the  Last.fm API. For the time being you can only get data from Last.fm. 

First of all I would like to thank [gordonbisnor][gordon] for his [Rails plugin][plugin] on which I started building. I started writing this library as I was not satisfied with existing Ruby clients for Last.fm. This project is far from being complete and it is not well tested but works quite well for my current project. The reason for writing this library is that most of the existing clients were not Rubyish enough and were tightly attached to Rails. In order to start using this library be sure you have a [Last.fm API][api] key and secret key.


## Installation

### Gem install

    sudo gem install last_fm

Then in your code require it as 

    require 'last_fm'


## Examples

Load your configuration

    LastFm.load_configuration(your_api_key, your_secret+key)

Get information for an artist

    artist = LastFm::Artist.new('Pink Floyd')

See the attributes for the artist object

    artist.methods

Get an album of this artist

    artist.album('The Wall')

Get a track of this artist

    artist.track('High Hopes')

Get an album

    LastFm::Album.new('Bonobo','Animal Magic')
    LastFm::Album.search('Bonobo','Animal Magic')
    LastFm::Artist.search('Bonobo').album('Animal Magic')

Get a track

    LastFm::Track.new('Bonobo','Silver')
    LastFm::Track.search('Bonobo','Silver')
    LastFm::Track.search('Bonobo').album('Silver')

Get user information

    LastFm::User.new('p3010010').top_albums


## Dependencies

The only requirement is ActiveSupport.


## Notes

LastFm gem was developed in a hurry and is not a full blown LastFm client neither extensively tested. Feel free to fork it :)


## License (The MIT License)

Copyright (c) 2009 Panagiotis Papadopoulos.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.





[gordon]: http://github.com/gordonbisnor/
[plugin]: http://github.com/gordonbisnor/lastfm
[api]: http://www.last.fm/api

