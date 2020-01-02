# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  updated_movies = []
  index = 0 
  while index < movies_collection.length do 
    current_movie_data = movie_with_director_name(name, movies_collection[index])
    updated_movies.push(current_movie_data)
    index += 1 
  end
  updated_movies
end


def gross_per_studio(collection)
  gross_per_studio = {}
  index = 0 
  while index < collection.length do 
    current_gross = 0 
    current_studio = collection[index][:studio]
    current_gross = collection[index][:worldwide_gross]
    if gross_per_studio[current_studio] == nil
      gross_per_studio[current_studio] = current_gross
    else
      gross_per_studio[current_studio] += current_gross
    end
    index += 1 
  end
  gross_per_studio
end


def movies_with_directors_set(source)
  movies_with_directors_set = []
  row_index = 0 
  while row_index < source.length do 
    name = source[row_index][:name]
    movies_with_directors_set.push(movies_with_director_key(name, source[row_index][:movies]))
    row_index += 1 
  end
  movies_with_directors_set
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
