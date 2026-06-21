cask "uttr" do
  version "0.1.4"
  sha256 "abf4cec5ce8fe99adeca11ecf29ed6d2dea06e38ec4c706cd4a8f48fa05ab4da"

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
