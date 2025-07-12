defmodule Htop do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "htop"
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
  def deps(), do: []
  @impl true
  def source(), do: "https://github.com/htop-dev/htop/archive/refs/tags/3.4.1.tar.gz"
  
  @impl true
  def install(args) do
    System.cmd("sh", ["autogen.sh", "--prefix=#{args.prefix}"], cd: args.cwd)
    System.cmd("sh", ["configure", "--prefix=#{args.prefix}"], cd: args.cwd)
    System.cmd("make", [], cd: args.cwd)
    System.cmd("make", ["install"], cd: args.cwd)

    :ok
  end
end
