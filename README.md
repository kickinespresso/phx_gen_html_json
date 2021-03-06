# PhxGenHtmlJson

[Blog Post](https://kickinespresso.com/posts/generating-html-and-json-scaffold-with-phoenix-1-3-1-3-2-generorators)


## Generators

    mix phx.gen.html Blog Post posts title:string content:string
    mix phx.gen.json Blog Post posts title:string content:string --web Api --no-context --no-schema

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

Initally, for the project, we used the following command with `and`:

    mix phx.gen.json Blog Post posts title:string content:string --web Api --no-context and --no-schema

This should have been removed and caused some issues with our `PhxGenHtmlJsonWeb.Api.PostControllerTest` test cases. The [8739c189b7c2a5d16e8fc9c047bdf65734beaa47](https://github.com/kickinespresso/phx_gen_html_json/commit/8739c189b7c2a5d16e8fc9c047bdf65734beaa47) change reflects what was needed to fix this issue. 


## Starting

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
