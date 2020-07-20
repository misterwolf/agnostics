# Data scraping as explained here: https://en.wikipedia.org/wiki/Data_scraping

require 'colorize'
require 'net/http'
require 'json'

@requested = {} # preserve all requested already done to not repeat them

def make_request(url, do_anyway: false)
  uri = URI(url)
  @requested[uri.path] ||= Net::HTTP.get(uri)

  # force request in case we want fresh data
  @requested[uri.path] = Net::HTTP.get(uri) if do_anyway

  JSON.parse(@requested[uri.path])
end

def genderize(string)
  downcased = string.downcase

  # show color as "sexed-color", although I follow the no-gender theory
  if downcased == 'female'
    "#{string} ♀".colorize(:light_magenta)
  elsif downcased == 'male'
    "#{string} ♂".colorize(:light_cyan)
  else
    "#{string} ⚥".colorize(:white)
  end
end

def scrap_people(people)
  # get films which this specific people played
  film_titles = people['films'].map do |film|
    films = make_request("#{film}?fields=title")

    films['title'] # it return id and field, so ['field']
  end.join(', ')

  species_requested = make_request("#{people['species']}?fields=name")['name']

  puts '------------------------------------------------------------'
  puts "Name: #{people['name']}"
  puts "Gender: #{genderize(people['gender'])}"
  puts "Age: #{people['age']}"
  puts "Eye Color: #{people['eye_color']}"
  puts "Films played: #{film_titles}"
  puts "Species: #{species_requested}"
  puts "Person url: #{people['url']}"
  puts '------------------------------------------------------------'
  puts "\n\n\n"
end

humans = make_request('https://ghibliapi.herokuapp.com/species?name=Human')
people_uris = humans.first['people'] # anyway, uris is typo...

people_uris.each do |people_uri|
  people = make_request(people_uri)

  scrap_people(people)
end
