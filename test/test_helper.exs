ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Superfundme.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Superfundme.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Superfundme.Repo)

