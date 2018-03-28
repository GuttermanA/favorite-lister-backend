class ApiAdapter
  def self.search(search_term:)
    term = search_term.gsub(" ", "%").downcase
    url = "https://api.themoviedb.org/3/search/movie?query=#{term}&api_key=#{ENV['API_KEY']}"
    res = RestClient.get(url)
    JSON.parse(res)
  end

  def self.default
    url = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['API_KEY']}&include_adult=false&include_video=false&page=1&primary_release_year=#{Date.today.year}"
    res = RestClient.get(url)
    JSON.parse(res)
  end
end
