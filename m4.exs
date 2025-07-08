defmodule M4 do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "m4"
  @impl true
  def version(), do: "1.4.20"
  @impl true
  def homepage(), do: "https://www.gnu.org/software/m4"
  @impl true
  def license(), do: "GPL-3.0-or-later"
  @impl true
  def type(), do: "bin"
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: []
  @impl true
  def source(), do: "https://ftp.gnu.org/gnu/m4/m4-1.4.20.tar.xz"
  
  @impl true
  def install(args) do
    System.cmd("sh", ["configure", "--prefix=#{args.prefix}"], cd: args.cwd)
    System.cmd("make", [], cd: args.cwd)
    System.cmd("make", ["install"], cd: args.cwd)

    :ok
  end
end
