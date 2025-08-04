defmodule Libunistring do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "libunistring"
  @impl true
  def description(), do: "C library for manipulating unistrings"
  @impl true
  def version(), do: "1.3"
  @impl true
  def homepage(), do: "https://www.gnu.org/software/libunistring"
  @impl true
  def license(), do: "GPL-2.0"
  @impl true
  def type(), do: :bin 
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: []
  @impl true
  def source(), do: "https://ftp.gnu.org/gnu/libunistring/libunistring-1.3.tar.xz"
  
  @impl true
  def install(args) do
    with {_, 0} <- System.cmd("sh", ["configure", "--prefix=#{args.prefix}", "--disable-silent-rules"], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", [], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", ["install"], cd: args.cwd, into: IO.stream()) do
      :ok
    else
      {_, code} -> {:error, "Build step failed with code #{code}"}
    end
  end
end
