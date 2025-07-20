defmodule TexInfo do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "texinfo"
  @impl true
  def description(), do: "Official documentation format of the GNU project"
  @impl true
  def version(), do: "7.2"
  @impl true
  def homepage(), do: "https://www.gnu.org/software/texinfo"
  @impl true
  def license(), do: "GPL-3.0-or-later"
  @impl true
  def type(), do: :bin 
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: [
    "gettext",
    "libunistring"
  ]
  @impl true
  def source(), do: "https://ftpmirror.gnu.org/texinfo/texinfo-7.2.tar.xz"

  # Important, this does use perl from macos to build
  # right now, can probably get away without defining that here
  # but may be important for the future
  
  @impl true
  def install(args) do
    configure_args = [
      "configure",
      "--disable-dependency-tracking",
      "--prefix=#{args.prefix}",
      "--disable-install-warnings"
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
