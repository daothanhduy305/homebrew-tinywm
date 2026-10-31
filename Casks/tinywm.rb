cask "tinywm" do
  version "0.7.1"
  sha256 "f811b3a14f6e9c9d25511c9f37403947686ca4230f4d68f6679559a597fc2d47"

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
