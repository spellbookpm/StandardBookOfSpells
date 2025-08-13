defmodule Ncurses do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "ncurses"
  @impl true
  def description(), do: "Text-based UI Library"
  @impl true
  def version(), do: "6.5"
  @impl true
  def homepage(), do: "https://ftp.gnu.org/gnu/ncurses/ncurses-6.5.tar.gz"
  @impl true
  def license(), do: "ISC"
  @impl true
  def type(), do: :bin 
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: [
    "autoconf",
    "automake",
    "libtool"
  ]
  @impl true
  def source(), do: "https://ftpmirror.gnu.org/ncurses/ncurses-6.5.tar.gz"
  
  @impl true
  def install(args) do
    with {_, 0} <- System.cmd("sh", ["configure", "--prefix=#{args.prefix}"], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", [], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", ["install"], cd: args.cwd, into: IO.stream()) do
      :ok
    else
      {_, code} -> {:error, "Build step failed with code #{code}"}
    end
  end
end
