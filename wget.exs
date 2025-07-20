defmodule Wget do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "wget"
  @impl true
  def description(), do: "Internet file retriever"
  @impl true
  def version(), do: "1.25.0"
  @impl true
  def homepage(), do: "https://www.gnu.org/software/wget"
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
  def source(), do: "https://ftpmirror.gnu.org/wget/wget-1.25.0.tar.gz"

  # Important, this does use perl from macos to build
  # right now, can probably get away without defining that here
  # but may be important for the future
  
  @impl true
  def install(args) do
    configure_args = [
      "configure",
      "--prefix=#{args.prefix}",
      "--disable-pcre",
      "--disable-pcre2",
      "--without-libpsl",
      "--without-included-regex"
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
