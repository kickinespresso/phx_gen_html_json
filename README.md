# PhxGenHtmlJson

[Blog Post](https://kickinespresso.com/posts/generating-html-and-json-scaffold-with-phoenix-1-3-1-3-2-generorators)


## Generators

    mix phx.gen.html Blog Post posts title:string content:string
    mix phx.gen.json Blog Post posts title:string content:string --web Api --no-context and --no-schema

### Other modifications

Add `as: :api` to `scope "/api", PhxGenHtmlJsonWeb.Api do` as shown below: 

Generated Routes 

    scope "/api", PhxGenHtmlJsonWeb.Api do
      pipe_through :api
      ...
      resources "/posts", PostController
    end

Modified for the correct route paths:

    scope "/api", PhxGenHtmlJsonWeb.Api, as: :api do
      pipe_through :api
      ...
      resources "/posts", PostController
    end

## Starting

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
