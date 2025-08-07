defmodule Erlang do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "erlang"
  @impl true
  def description(), do: "Programming language for highly scalable real-time systems"
  @impl true
  def version(), do: "28.0.2"
  @impl true
  def homepage(), do: "https://www.erlang.org"
  @impl true
  def license(), do: "Apache-2.0"
  @impl true
  def type(), do: :bin 
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: [
    "autoconf",
    "libtool"
  ]
  @impl true
  def source(), do: "https://github.com/erlang/otp/releases/download/OTP-28.0.2/otp_src_28.0.2.tar.gz"

  # Important, this does use perl from macos to build
  # right now, can probably get away without defining that here
  # but may be important for the future
  
  @impl true
  def install(args) do
    configure_args = [
      "configure",
      "--prefix=#{args.prefix}"
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
