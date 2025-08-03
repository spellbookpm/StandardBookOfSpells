defmodule M4 do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "libtool"
  @impl true
  def description(), do: "Generic library support script"
  @impl true
  def version(), do: "2.5.4"
  @impl true
  def homepage(), do: "https://www.gnu.org/software/libtool"
  @impl true
  def license(), do: "GPL-2.0-or-later"
  @impl true
  def type(), do: :bin 
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: ["m4"]
  @impl true
  def source(), do: "https://ftp.gnu.org/gnu/libtool/libtool-2.5.4.tar.xz"
  
  @impl true
  def install(args) do
    with {_, 0} <- System.cmd("sh", ["configure", "--prefix=#{args.prefix}", "--program-prefix=g"], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", [], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", ["install"], cd: args.cwd, into: IO.stream()) do
      :ok
    else
      {_, code} -> {:error, "Build step failed with code #{code}"}
    end
  end
end
