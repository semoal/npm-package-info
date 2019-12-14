# NpmPackageInfo

Fetches the package information from a npm package.
> Highly inspired in https://github.com/jesseditson/npm-package written in JavaScript.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `npm_package_info` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:npm_package_info, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/npm_package_info](https://hexdocs.pm/npm_package_info).


## Try tests

There's a private registry test, so you must change the test for local development to point your private registry.

For ej:
```sh
export TEST_NPM_TOKEN=7512f9e6-80
mix test --trace
```