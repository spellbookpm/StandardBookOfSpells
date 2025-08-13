defmodule M4 do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "m4"
  @impl true
  def description(), do: "Macro processing language"
  @impl true
  def version(), do: "1.4.20"
  @impl true
  def homepage(), do: "https://www.gnu.org/software/m4"
  @impl true
  def license(), do: "GPL-3.0-or-later"
  @impl true
  def type(), do: :bin 
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: []
  @impl true
  def source(), do: "https://ftpmirror.gnu.org/m4/m4-1.4.20.tar.xz"
  
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
