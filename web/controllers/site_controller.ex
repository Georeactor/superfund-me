defmodule Superfundme.SiteController do
  use Superfundme.Web, :controller

  alias Superfundme.Site

  plug :scrub_params, "site" when action in [:create, :update]

  def index(conn, _params) do
    sites = Repo.all(Site)
    render(conn, "index.html", sites: sites)
  end

  def new(conn, params) do
    changeset = Site.changeset(%Site{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"key" => key, "site" => site_params}) do
    if key == System.get_env("SECRET_QUERY") do
      changeset = Site.changeset(%Site{}, site_params)

      case Repo.insert(changeset) do
        {:ok, _site} ->
          conn
          |> put_flash(:info, "Site created successfully.")
          |> redirect(to: site_path(conn, :index))
        {:error, changeset} ->
          render(conn, "new.html", changeset: changeset)
      end
    end
  end

  def show(conn, %{"id" => id}) do
    site = Repo.get!(Site, id)
    render(conn, "show.html", site: site)
  end

  def edit(conn, %{"id" => id}) do
    site = Repo.get!(Site, id)
    changeset = Site.changeset(site)
    render(conn, "edit.html", site: site, changeset: changeset)
  end

  def update(conn, %{"id" => id, "key" => key, "site" => site_params}) do
    if key == System.get_env("SECRET_QUERY") do
      site = Repo.get!(Site, id)
      changeset = Site.changeset(site, site_params)

      case Repo.update(changeset) do
        {:ok, site} ->
          conn
          |> put_flash(:info, "Site updated successfully.")
          |> redirect(to: site_path(conn, :show, site))
        {:error, changeset} ->
          render(conn, "edit.html", site: site, changeset: changeset)
      end
    end
  end

  def delete(conn, %{"id" => id, "key" => key}) do
    if key == System.get_env("SECRET_QUERY") do
      site = Repo.get!(Site, id)

      # Here we use delete! (with a bang) because we expect
      # it to always work (and if it does not, it will raise).
      Repo.delete!(site)

      conn
      |> put_flash(:info, "Site deleted successfully.")
      |> redirect(to: site_path(conn, :index))
    end
  end
end
