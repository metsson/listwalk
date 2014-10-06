# What is listwalk?
Although the name doesn't say it all, listwalk is a simple, yet genious, way of discovering new music on Spotify. What it does is that it generates a playlist on Spotify based on one single term - a word! So for instance, searching for **'love'** will result into a playlist of 45 songs. All from different genres and artists that only share one thing in common; they either include the word **'love'** in their track, artist or album name. Above that, only song that have a popularity level higher than 50 are taken into account. The result: a playlist with songs you perhaps never heard of before.

## Requirements

1. Spotify (well you will need an account in order to listen to the lovely playlists that are generated)
2. Ruby on Rails 4 running on Ruby 2
3. [RSpotify](https://github.com/guilhermesad/rspotify) gem for Ruby on Rails

## Installation

The installation process is quite easy for listwalk. No steps above the ones below are needed to get you up and running:

Clone this repo locally
	
	git clone git@github.com:metsson/listwalk.git

Before starting your server, make sure all the gems are installed

	$ bundle install

Then, run the migration files. There is actually only a simple ActiveRecord model for keeping track of trending keywords that should be in place

	$ rake db:migrate

## Setting up Spotify API credentials with Figaro

listwalk utilizes [Figaro](https://github.com/laserlemon/figaro) for storing your Spotify API credentials in a safe manner. Although Figaro comes pre-installed with listwalk when cloned, you might have to run Figaro in your terminal in order to have your API client credentials (tokens) available for the application. [Read more about Spotify Web API in here](https://developer.spotify.com/web-api/).

Once you have registered your Spotify App, run this in your terminal:

	$ figaro install

Then head over to /config/application.yml and enter your credentials:
	
	spotify_client_id: 'your_client_id'
	spotify_client_secret: 'your_client_secret'

## Contribute!

I would love some help with listwalk! Let's make it smarter together so that other people can have better use of it. I have a lot of other projects going on at the moment but I can assure you that each and every PR is welcomed! 

After forking/cloning the repo this is what you do!

	# Create your new branch locally
	$ git checkout -b listwalk-new-feature
	# Make your wonderful changes and commit
	$ git commit -am 'Some test units for Search'
	# Push it baby!
	$ git push origin listwalk-new-feature

Once you're done with this steps, make sure to send a pull request for your feature. 