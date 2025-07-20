defmodule Xz do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "xz"
  @impl true
  def description(), do: "General purpose data compression with high compression ration"
  @impl true
  def version(), do: "5.8.1"
  @impl true
  def homepage(), do: "https://tukaani.org/xz"
  @impl true
  def license(), do: "GPL-2.0-or-later"
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
  def source(), do: "https://github.com/tukaani-project/xz/releases/download/v5.8.1/xz-5.8.1.tar.gz"

  @impl true
  def install(args) do
    configure_args = [
      "configure",
      "--prefix=#{args.prefix}",
      "--disable-silent-rules",
      "--disable-nls"
    ]

    with {_, 0} <- System.cmd("sh", configure_args, cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", ["check"], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", ["install"], cd: args.cwd, into: IO.stream()) do
      :ok
    else
      {0, code} -> {:error, "Build step failed with code #{code}"}
    end
  end
end
