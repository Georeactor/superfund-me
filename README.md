# Superfund Me

Reviving an old idea - mapping Superfund environmental sites near you and around the United States
using OpenStreetMap

## Why map a Superfund site?

* public interest, environmental concern
* situation on the ground often different from TIGER and other imported data
* site often includes service roads and other features not in TIGER and other imported data
* changes frequently

## Technical

Phoenix framework, written in the Elixir language

Follow <a href="http://www.phoenixframework.org/docs/heroku">Phoenix on Heroku documentation</a>
to set the buildpacks to host the app.

Add Heroku's PostgreSQL database add-on.

Running migrations on Heroku:

```heroku run 'mix ecto.migrate' --app superfundme```

## License

Open source, MIT license
