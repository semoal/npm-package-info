defmodule NpmPackageInfo do
  @moduledoc """
    Documentation for NpmPackageInfo.
    Fetches the package information from a npm package.
    Highly inspired in https://github.com/jesseditson/npm-package written in JavaScript.
  """

  @doc """
  Given a package name recovers all his npm information

  ## Options

  * `:bearer` - Concatenated tokens for login with a private registry

  ## Examples
      NpmPackageInfo.parse_package("react")
      {:ok,
      %{
        "_id" => "react",
        "_rev" => "1319-1d350c764708c5251102f55808f9fd0f",
        "bugs" => %{"url" => "https://github.com/facebook/react/issues"},
        "description" => "React is a JavaScript library for building user interfaces.",
        "dist-tags" => %{
          "alpha" => "16.9.0-alpha.0",
          "canary" => "0.0.0-1022ee0ec",
          "experimental" => "0.0.0-experimental-b53ea6ca0",
          "latest" => "16.12.0",
          "next" => "0.0.0-b53ea6ca0",
          "unstable" => "0.0.0-experimental-2c169a568"
        },
        "homepage" => "https://reactjs.org/",
        "keywords" => ["react"],
        "license" => "MIT",
        "maintainers" => [],
        "name" => "react",
        "readme" => "",
        "readmeFilename" => "",
        "repository" => %{
          "directory" => "packages/react",
          "type" => "git",
          "url" => "git+https://github.com/facebook/react.git"
        }
      }


      ## Examples
      NpmPackageInfo.parse_package("react", %{bearer: "token"})
      {:ok,
      %{
        "_id" => "react-from-private-registry",
        "_rev" => "1319-1d350c764708c5251102f55808f9fd0f",
        "bugs" => %{"url" => "https://github.com/facebook/react/issues"},
        "description" => "React is a JavaScript library for building user interfaces.",
        "dist-tags" => %{
          "alpha" => "16.9.0-alpha.0",
          "canary" => "0.0.0-1022ee0ec",
          "experimental" => "0.0.0-experimental-b53ea6ca0",
          "latest" => "16.12.0",
          "next" => "0.0.0-b53ea6ca0",
          "unstable" => "0.0.0-experimental-2c169a568"
        },
        "homepage" => "https://reactjs.org/",
        "keywords" => ["react"],
        "license" => "MIT",
        "maintainers" => [],
        "name" => "react-from-private-registry",
        "readme" => "",
        "readmeFilename" => "",
        "repository" => %{
          "directory" => "packages/react",
          "type" => "git",
          "url" => "git+https://github.com/facebook/react.git"
        }
      }
  """
  def parse_package(name, opts \\ %{}) do
    url = Path.join("https://registry.npmjs.org", name)
    {:ok, %Tesla.Env{:body => body}} = Tesla.get(url, headers: add_auth(opts))
    {:ok, body |> Jason.decode!()}
  end

  defp add_auth(opts) do
    case Map.fetch(opts, :bearer) do
      {:ok, bearer} -> [{"authorization", "Bearer " <> bearer}]
      _ -> []
    end
  end
end
