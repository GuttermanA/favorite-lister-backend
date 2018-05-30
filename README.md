# Favorite Lister Backend

This is the Rails API back-end for the React web application [favorite-lister.surge.sh](http://favorite-lister.surge.sh). The Github for the front-end can be found [here](https://github.com/GuttermanA/favorite-lister). The Rails API contains models and controllers for the web application and the link to the Movie DB API for searching.

**NOTE:** You will need a Movie DB API key for this app to function correctly. The key is stored in the ENV['api_key'] variable.

**ANOTHER NOTE:** Rack cors is configured to accept requests from localhost:3001

#### Frontend Demo

<a href="http://www.youtube.com/watch?feature=player_embedded&v=hD0RncbljAQ
" target="_blank"><img src="http://img.youtube.com/vi/hD0RncbljAQ/0.jpg"
alt="Demo" width="240" height="180" border="10" /></a>

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
5. Setup figaro gem for storing API keys and DB credentials, run:
```
bundle exec figaro install
```
and then configure ENV in created application.yml file

6. Set up database
```
rake db:create
rake db:migrate
```
7. Start the Rails server
```
rails s
```
8. In browser, navigate to the url localhost:3000. This should give you a message that the application is running. Since this is an API, it will only give you JSON responses.

## API Routes

#### Movies Controller

```
GET /search
```
Takes search term, returns response from the MovieDB API

```
GET /default
```
Takes no params, returns most recent movies from current year.

#### Lists Controller

```
GET /lists
```
Returns all lists with list serializer.

```
POST /lists
```
Takes list in request body, returns a response with a success if list is saved and failure if list fails to save.

```
GET /lists/:id
```
Takes list id param. Returns list if found.

```
PATCH /lists/:id
```

Takes updated list in request body, returns a response with a success if list is updated and failure if list fails to update.

```
DELETE /lists/:id
```
Takes list id param. Returns success message if list deleted and failure if list is not

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
