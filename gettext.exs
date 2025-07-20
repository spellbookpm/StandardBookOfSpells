defmodule GetText do
  @behaviour Spellbook.Spell

  @impl true
  def name(), do: "gettext"
  @impl true
  def description(), do: "GNU internationalization (i18n) and localization (l10n) library"
  @impl true
  def version(), do: "0.26"
  @impl true
  def homepage(), do: "https://www.gnu.org/software/gettext"
  @impl true
  def license(), do: "GPL-3.0-or-later"
  @impl true
  def type(), do: :bin 
  @impl true
  def checksum(), do: ""
  @impl true
  def deps(), do: [
    "libunistring"
  ]
  @impl true
  def source(), do: "https://ftp.gnu.org/gnu/gettext/gettext-0.26.tar.xz"
  
  @impl true
  def install(args) do
    configure_args = [
      "configure",
      "--prefix=#{args.prefix}",
      "--disable-silent-rules",
      "--with-included-glib",
      "--with-included-libcroco",
      "--with-emacs",
      "--disable-java",
      "--disable-csharp",
      "--without-git",
      "--without-cvs",
      "--without-xz",
      "--with-included-gettext",
      "CFLAGS=-Wno-incompatible-function-pointer-types"
    ]
 
    System.put_env("am_cv_func_iconv_works", "yes")

    with {_, 0} <- System.cmd("sh", configure_args, cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", [], cd: args.cwd, into: IO.stream()),
         {_, 0} <- System.cmd("make", ["install"], cd: args.cwd, into: IO.stream()) do
      :ok
    else
      {_, code} -> {:error, "Build step failed with code #{code}"}
    end
  end
end
