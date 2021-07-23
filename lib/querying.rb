def select_books_titles_and_years_in_first_series_order_by_year
  #selects all of the books titles and years in the first series and orders them chronologically
  "SELECT title, year
  FROM books
  WHERE series_id=1
  ORDER BY year"
end

def select_name_and_motto_of_char_with_longest_motto
  # returns the name and motto of the character with the longest motto
  "SELECT name, motto
  FROM characters
  ORDER BY LENGTH(motto) DESC
  LIMIT 1"
end


def select_value_and_count_of_most_prolific_species
  # determines the most prolific species of characters and return its value and count
  "SELECT species, COUNT(*) 
  FROM characters 
  GROUP BY species 
  ORDER BY COUNT(species) DESC 
  LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  #selects the authors names and their series' subgenres
  "SELECT authors.name, subgenres.name
  FROM authors
  JOIN series
  ON series.author_id = authors.id
  JOIN subgenres
  ON series.subgenre_id = subgenres.id"
end

def select_series_title_with_most_human_characters
  # selects the series title with the most characters that are the species "human"
  "SELECT series.title
  FROM series
  JOIN books
  ON books.series_id = series.id
  JOIN character_books
  ON character_books.book_id = books.id
  JOIN characters
  ON character_books.character_id = characters.id
  WHERE characters.species = 'human'
  GROUP BY series.title
  ORDER BY COUNT(*) DESC
  LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in
  #selects all of the character names and the number of books they have appeared in, grouped by character name, in descending order by number of books and ascending order by character name
  "SELECT characters.name, COUNT(*) as book_count 
  FROM character_books 
  JOIN characters 
  ON character_books.character_id = characters.id 
  GROUP BY characters.name 
  ORDER BY book_count DESC, characters.name"
end
