cask "uttr" do
  version "0.1.7"
  sha256 "c923e40905e49bb650d840a7163c8e2cf53d8877dcb844f43d2e5d978ca040d0"

  url "https://github.com/ShishirAravindan/uttr/releases/download/v#{version}/uttr.zip"
  name "Uttr"
  desc "macOS speech-to-text utility powered by Parakeet on the Neural Engine"
  homepage "https://github.com/ShishirAravindan/uttr"

  depends_on macos: :sonoma

  app "uttr.app"

  caveats <<~EOS
    On first launch, you may need to allow the app in:
      System Settings → Privacy & Security → Open Anyway

    Grant these permissions when prompted:
      - Microphone access (for speech recording)
      - Accessibility access (for global hotkey and paste-at-cursor)
  EOS

  zap trash: [
    "~/Library/Application Support/uttr",
  ]
end
