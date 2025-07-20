defmodule Automake do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "automake"
  @impl true
  def description(), do: "Tool for generating GNU Standards-compliant Makefiles"
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
    with {_, 0} <- System.cmd("sh", ["configure", "--prefix=#{args.prefix}"], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", [], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", ["install"], cd: args.cwd, into: IO.stream()) do
      :ok
    else
      {0, code} -> {:error, "Build step failed with code #{code}"}
    end
  end
end
