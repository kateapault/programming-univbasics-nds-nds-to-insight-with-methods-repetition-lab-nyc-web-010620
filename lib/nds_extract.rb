$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  # Write this implementation
  directors_names = []
  for director_hash in source do
    directors_names << director_hash[:name]
  end
  directors_names
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  
  gross_for_all_directors = 0
  
  gross_by_directors = directors_totals(source)
  director_names = list_of_directors(source)
  
  i = 0
  while i < director_names.length do
    gross_for_all_directors += gross_by_directors[director_names[i]]
    i += 1
  end
  
  gross_for_all_directors
  
  
end

pp directors_database