class ApiAdapter
  def self.search(search_term:)
    byebug
    term = search_term.gsub(" ", "%").downcase
    url = "https://api.themoviedb.org/3/search/movie?query=#{term}&api_key=#{ENV['API_KEY']}"
    json = RestClient.get(url)
    JSON.parse(json)
  end
end
