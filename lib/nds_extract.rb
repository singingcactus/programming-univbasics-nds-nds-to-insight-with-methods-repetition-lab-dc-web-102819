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
  result = []
  director_index = 0
  while director_index < source.size do
    result[director_index] = source[director_index][:name]
    director_index += 1
  end
  result
  # Write this implementation
end

def total_gross(source)
  gross = 0
  director_list = list_of_directors(source)
  directors_with_gross = directors_totals(source)
  search_iteration = 0

  while search_iteration < source.length do
    seek_name = director_list[search_iteration]
    gross += directors_with_gross[seek_name]
    search_iteration += 1
  end

  gross

    # Write this implementation
    #
    # Should use methods:
    # 1. directors_totals: returns a Hash of { dir_name => gross }
    # 2. list_of_directors: names provides an Array of directors names (use
    #
    # Visit each key (i.e. director name), look up the value in the hash
    # returned by directors_totals, and add it to a running total. When done,
    # return the total
  end
