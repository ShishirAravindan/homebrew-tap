cask "uttr" do
  version "0.1.11"
  sha256 "3c5071e2f3e8951d4ed5f052c7d5f9cacdbd143747a153a4609fab04af13a3d9"

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
