module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rated_and_several_countries?(film)
        film['country'].to_s.include?(',') &&
          !film['rating_kinopoisk'].nil? &&
          film['rating_kinopoisk'].to_f.positive?
      end

      def rating(array)
        uprated_films = array.select { |film| rated_and_several_countries?(film) }
        rating_array = uprated_films.map { |film| film['rating_kinopoisk'].to_f }
        rating_array.reduce(:+).to_f / rating_array.length
      end

      def chars_count(films, threshold)
        uprated_films = films.select { |film| film['rating_kinopoisk'].to_f > threshold }
        uprated_films.map { |film| film['name'].count 'и' }.reduce(:+)
      end
    end
  end
end
