cask "tinywm" do
  version "0.8.1"
  sha256 "b6ea6ceeff1d733152145baddbc1675b741586d93ec1ede3e6af4f220cb0c28c"

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
