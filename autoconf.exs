defmodule Autoconf do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "autoconf"
  @impl true
  def version(), do: "2.72"
  @impl true
  def homepage(), do: "https://www.gnu.org/software/autoconf"
  @impl true
  def license(), do: "GPL-3.0-or-later"
  @impl true
  def type(), do: :bin 
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: ["m4"]
  @impl true
  def source(), do: "https://ftpmirror.gnu.org/autoconf/autoconf-2.72.tar.gz"

  # Important, this does use perl from macos to build
  # right now, can probably get away without defining that here
  # but may be important for the future
  
  @impl true
  def install(args) do
    System.cmd("sh", ["configure", "--prefix=#{args.prefix}"], cd: args.cwd, into: IO.stream())
    System.cmd("make", [], cd: args.cwd, into: IO.stream())
    System.cmd("make", ["install"], cd: args.cwd, into: IO.stream())

    :ok
  end
end
