cask "uttr" do
  version "0.1.11"
  sha256 "3c5071e2f3e8951d4ed5f052c7d5f9cacdbd143747a153a4609fab04af13a3d9"

  url "https://github.com/ShishirAravindan/uttr/releases/download/v#{version}/uttr.zip"
  name "Uttr"
  desc "macOS speech-to-text utility powered by Parakeet on the Neural Engine"
  homepage "https://github.com/ShishirAravindan/uttr"

  depends_on macos: :sonoma

  app "uttr.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/uttr.app"],
                   must_succeed: false
  end

  uninstall quit: "io.github.Rakk301.uttr"

  zap trash: [
    "~/Library/Application Support/uttr",
    "~/Library/Caches/io.github.Rakk301.uttr",
    "~/Library/HTTPStorages/io.github.Rakk301.uttr",
    "~/Library/Logs/uttr",
    "~/Library/Preferences/io.github.Rakk301.uttr.plist",
    "~/Library/Saved Application State/io.github.Rakk301.uttr.savedState",
  ]

  caveats <<~EOS
    Homebrew removed the macOS quarantine flag from uttr.app, so it
    should open without the Open Anyway step. If macOS still blocks it,
    allow it in:
      System Settings → Privacy & Security → Open Anyway

    Grant these permissions when prompted:
      - Microphone access (for speech recording)
      - Accessibility access (for global hotkey and paste-at-cursor)

    Upgrading or uninstalling quits uttr first. Reopen it from
    Applications after `brew upgrade`.

    `brew uninstall --zap` keeps two things:
      - The speech model (~600 MB), which other FluidAudio apps can share:
          ~/Library/Application Support/FluidAudio/Models
      - Your transcription history:
          ~/Documents/History/transcription_history.json
    Delete them yourself if you no longer need them.
  EOS
end
