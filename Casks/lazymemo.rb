cask "lazymemo" do
  version "0.9.1"
  sha256 "eebb6013a2b741a3138674fc84e84181d896b806ca0bbcc9a5a9e5c5294d1ae9"

  url "https://github.com/bunhine0452/lazymemo/releases/download/v#{version}/lazymemo-#{version}.zip",
      verified: "github.com/bunhine0452/lazymemo/"
  name "lazymemo"
  desc "Desktop-resident notes and calendar that assume you are lazy"
  homepage "https://github.com/bunhine0452/lazymemo"

  depends_on macos: ">= :tahoe"

  app "LazyMemo.app"

  # 이 앱은 ad-hoc 서명이다 — 유료 개발자 계정이 없어 공증을 받지 못했다.
  # Homebrew 는 내려받은 것에 검역 딱지를 붙이고, macOS 15 부터는 우클릭-열기
  # 우회가 사라져 딱지가 붙은 미공증 앱은 「손상되었다」며 열리지 않는다.
  #
  # 그래서 딱지를 떼고 설치한다. **이것은 미봉책이다** — 옳은 답은 Developer ID
  # 공증이고, 그때 이 블록은 통째로 지운다 (설계문서 §12).
  #
  # 떼는 것이 안전한 근거는 하나뿐이다: 이 zip 은 같은 저장소의 태그에서
  # 스크립트 하나로 만들어졌고, 소스에서 직접 빌드해 같은 것이 나오는지
  # 누구나 확인할 수 있다 (./scripts/package-release.sh).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/LazyMemo.app"],
                   sudo: false
  end

  uninstall quit: "io.github.bunhine0452.lazymemo"

  zap trash: [
    "~/Library/Application Support/lazymemo",
  ]

  caveats <<~EOS
    lazymemo 는 공증받지 않은 앱이라 설치 중에 검역 딱지를 떼어 냈습니다.
    믿을 수 없다면 소스에서 직접 빌드하세요 — 그쪽이 1차 배포 경로입니다.

      git clone https://github.com/bunhine0452/lazymemo.git
      cd lazymemo && ./scripts/build-app.sh && open dist/LazyMemo.app

    메모는 ~/Documents/lazymemo 의 마크다운 파일입니다.
    이 앱을 지워도(brew uninstall) 메모는 남습니다.
  EOS
end
