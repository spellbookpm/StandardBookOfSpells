defmodule Htop do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "htop"
  @impl true
  def description(), do: "Improved top (interactive process viewer)"
  @impl true
  def version(), do: "3.4.1"
  @impl true
  def homepage(), do: "https://htop.dev"
  @impl true
  def license(), do: "GPL-2.0"
  @impl true
  def type(), do: :bin 
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: [
    "autoconf",
    "automake",
    "libtool",
    "pkgconf",
    "ncurses"
  ]
  @impl true
  def source(), do: "https://github.com/htop-dev/htop/archive/refs/tags/3.4.1.tar.gz"
  
  @impl true
  def install(args) do
    with {_, 0} <- System.cmd("sh", ["autogen.sh", "--prefix=#{args.prefix}"], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("sh", ["configure", "--prefix=#{args.prefix}"], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", [], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", ["install"], cd: args.cwd, into: IO.stream()) do
      :ok
    else
      {_, code} -> {:error, "Build step failed with code #{code}"}
    end
  end
end
