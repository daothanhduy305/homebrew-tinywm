cask "tinywm" do
  version "0.8.3"
  sha256 "fe236214479d427b3275e1f46ab7556ee9cb51ddc030f93d91e6541b1f087f36"

  url "https://github.com/daothanhduy305/tinywm/releases/download/v#{version}/tinywm-#{version}.zip"
  name "tinywm"
  desc "Scrolling window manager in the style of niri"
  homepage "https://github.com/daothanhduy305/tinywm"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "tinywm.app"

  # The app is self-signed, not notarized, so Gatekeeper would block it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/tinywm.app"]
  end

  zap trash: [
    "~/.config/tinywm",
    "~/Library/Application Support/tinywm",
    "~/Library/Preferences/dev.tinywm.plist",
  ]
end
