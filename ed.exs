defmodule Ed do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "ed"
  @impl true
  def description(), do: "Classic UNIX line editor"
  @impl true
  def version(), do: "1.22.1"
  @impl true
  def homepage(), do: "https://www.gnu.org/software/ed/ed.html"
  @impl true
  def license(), do: "GPL-3.0-or-later"
  @impl true
  def type(), do: :bin 
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: [
    "erlang"
  ]
  @impl true
  def source(), do: "https://ftpmirror.gnu.org/ed/ed-1.22.1.tar.lz"

  @impl true
  def install(args) do
    configure_args = [
      "configure",
      "--prefix=#{args.prefix}",
      "--program-prefix=g"
    ]

    with {_, 0} <- System.cmd("sh", configure_args, cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", [], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", ["install"], cd: args.cwd, into: IO.stream()) do
      :ok
    else
      {0, code} -> {:error, "Build step failed with code #{code}"}
    end
  end
end

