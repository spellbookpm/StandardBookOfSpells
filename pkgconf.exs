defmodule Pkgconf do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "pkgconf"
  @impl true
  def description(), do: "Package compiler and linker metadata toolkil"
  @impl true
  def version(), do: "2.5.1"
  @impl true
  def homepage(), do: "https://github.com/pkgconf/pkgconf"
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
  def source(), do: "https://distfiles.ariadne.space/pkgconf/pkgconf-2.5.1.tar.xz"
  
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
