# Favorite Lister Backend

This is the Rails API back-end for the React web application [favorite-lister.surge.sh](http://favorite-lister.surge.sh). The Github for the front-end can be found [here](https://github.com/GuttermanA/favorite-lister). The Rails API contains models and controllers for the web application and the link to the Movie DB API for searching.

**NOTE:** You will need a Movie DB API key for this app to function correctly. The key is stored in the ENV['api_key'] variable.

## Installing
1. Clone repository from GitHub
2. Open terminal
3. Navigate to the repository directory
```
cd favorite-lister-backend
```
4. Update and install required gems
```
bundle install
```
If using figaro gem for storing API keys provided with projection, run:
```
bundle exec figaro install
```
5. Set up database
```
rake db:create
rake db:migrate
```
6. Start the Rails server
```
rails s
```
7. In browser, navigate to the url localhost:3000. This should give you a message that the application is running. Since this is an API, it will only give you JSON responses.

## API Routes
     search GET    /search(.:format)          movies#search    default GET    /default(.:format)         movies#default
     movies GET    /movies(.:format)          movies#index
            POST   /movies(.:format)          movies#create
      lists GET    /lists(.:format)           lists#index
            POST   /lists(.:format)           lists#create
       list GET    /lists/:id(.:format)       lists#show            PATCH  /lists/:id(.:format)       lists#update
            PUT    /lists/:id(.:format)       lists#update            DELETE /lists/:id(.:format)       lists#destroy      users POST   /users(.:format)           users#create
       user GET    /users/:id(.:format)       users#show
movie_lists GET    /movie_lists(.:format)     movie_lists#index            POST   /movie_lists(.:format)     movie_lists#create
 movie_list GET    /movie_lists/:id(.:format) movie_lists#show            PATCH  /movie_lists/:id(.:format) movie_lists#update
            PUT    /movie_lists/:id(.:format) movie_lists#update            DELETE /movie_lists/:id(.:format) movie_lists#destroy

## Built With
* [Ruby on Rails](http://rubyonrails.org/) - web framework

## Contributing
1. Fork repository [here](https://github.com/feihafferkamp/mod2-project)
2. Create new branch for your feature
```
git checkout -b my-new-feature
```
3. Add and commit your changes
```
git commit -am 'Add some feature'
```
4. Push to your branch
```
git push origin my-new-feature
```
5. Create new pull request


## Authors
* Alexey Katalkin - [Github Profile](https://github.com/Raskovan)
* Alex Gutterman - [Github Profile](https://github.com/guttermana)
