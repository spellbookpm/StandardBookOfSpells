defmodule Automake do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "automake"
  @impl true
  def version(), do: "1.18.1"
  @impl true
  def homepage(), do: "https://www.gnu.org/software/automake"
  @impl true
  def license(), do: "GPL-2.0-or-later"
  @impl true
  def type(), do: :bin 
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: ["autoconf"]
  @impl true
  def source(), do: "https://ftpmirror.gnu.org/automake/automake-1.18.1.tar.xz"

  # Important, this does use perl from macos to build
  # right now, can probably get away without defining that here
  # but may be important for the future
  
  @impl true
  def install(args) do
    System.cmd("sh", ["configure", "--prefix=#{args.prefix}"], cd: args.cwd)
    System.cmd("make", [], cd: args.cwd)
    System.cmd("make", ["install"], cd: args.cwd)

    :ok
  end
end
