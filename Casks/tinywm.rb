cask "tinywm" do
  version "0.3.0"
  sha256 "3ad6f3bd31da068f144b4c1021e9676176f4af3861464d779d2db9057c76d484"

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
