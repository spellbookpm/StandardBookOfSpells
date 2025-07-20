defmodule GnuCoreUtils do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "gnu-c oreutils"
  @impl true
  def description(), do: "GNU File, Shell, and Text utilities"
  @impl true
  def version(), do: "9.7"
  @impl true
  def homepage(), do: "https://www.gnu.org/software/coreutils"
  @impl true
  def license(), do: "GPL-3.0-or-later"
  @impl true
  def type(), do: :bin 
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: [
    "autoconf",
    "automake",
    "bison",
    "gettext",
    "texinfo",
    "wget",
    "xz"
  ]
  @impl true
  def source(), do: "https://ftp.gnu.org/gnu/coreutils/coreutiles-9.7.tar.xz"
  
  @impl true
  def install(args) do
    {:error, "WIP"}

    # with {_, 0} <- System.cmd("sh", ["autogen.sh", "--prefix=#{args.prefix}"], cd: args.cwd, into: IO.stream()),
    #      {_, 0} <- System.cmd("sh", ["configure", "--prefix=#{args.prefix}", "--program-prefix=g", "--without-selinux"], cd: args.cwd, into: IO.stream()),
    #      {_, 0} <- System.cmd("make", [], cd: args.cwd, into: IO.stream()),
    #      {_, 0} <- System.cmd("make", ["install"], cd: args.cwd, into: IO.stream()) do
    #   :ok
    # else
    #   {_, code} -> {:error, "Build step failed with code #{code}"}
    # end
  end
end
