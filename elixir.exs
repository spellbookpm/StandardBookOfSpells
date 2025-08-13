defmodule ElixirLang do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "elixir"
  @impl true
  def description(), do: "Functional metaprogramming aware language built on Erlang VM"
  @impl true
  def version(), do: "1.18.4"
  @impl true
  def homepage(), do: "https://elixir-lang.org"
  @impl true
  def license(), do: "Apache-2.0"
  @impl true
  def type(), do: :bin 
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: [
    "erlang"
  ]
  @impl true
  def source(), do: "https://github.com/elixir-lang/elixir/archive/refs/tags/v1.18.4.tar.gz"

  @impl true
  def install(args) do
    with {_, 0} <- System.cmd("make", ["Q=", "PREFIX=#{args.prefix}", "install"], cd: args.cwd, into: IO.stream()) do
      :ok
    else
      {0, code} -> {:error, "Build step failed with code #{code}"}
    end
  end
end
