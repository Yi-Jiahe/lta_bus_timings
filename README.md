# LtaBusTimings

One of many consumers of the [LTA DataMall](https://datamall.lta.gov.sg/content/datamall/en.html) APIs to get bus timings. Hopefully with a good mix of accessibility, quick load times and functionality to set it apart.

The goals of this project are to:
  - Provide a webapp for easier use compared to a native app
  - Quick load times and SEO with SSR
  - Mix of location and favorites to provide opt-out of location services
  - Scalability with Erlang VM?
  - Learn Elixir

## To-Do

 - [ ] Query API for bus timings for bus stops
 - [ ] Location Services
   - [ ] Query API for 
   - [ ] Get user location
   - [ ] Return closest and list of next closest bus stops
 - [ ] Favorites
   - [ ] Save user preferences w/o sign-in/ login
 - [ ] Cool UI (w/o compromising too much on load times)
   - [ ] Timeline to show how close buses are

## Phoenix server stuff

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
