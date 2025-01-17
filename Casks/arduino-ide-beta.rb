cask "arduino-ide-beta" do
  version "2.0.0,rc9.2"
  sha256 "e760db6900861d0dfdb1fd6cb76aa7e079fbfdec879702754963e55cdf1bcf3f"

  url "https://downloads.arduino.cc/arduino-ide/arduino-ide_#{version.csv.first}-#{version.csv.second}_macOS_64bit.dmg"
  name "Arduino IDE"
  desc "Electronics prototyping platform"
  homepage "https://www.arduino.cc/en/software#experimental-software"

  livecheck do
    url "https://www.arduino.cc/en/software/"
    regex(/href=.*?arduino[._-]ide[._-]v?(\d+(?:\.\d+)+)[._-](\S+?)[._-]macos[._-]64bit\.dmg/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]},#{match[1]}" }
    end
  end

  conflicts_with cask: "arduino-ide-nightly"

  app "Arduino IDE.app"

  zap trash: [
    "~/Library/Application Support/arduino-ide",
    "~/.arduinoIDE",
  ]
end
