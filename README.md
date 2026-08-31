# homebrew-lazymemo

[lazymemo](https://github.com/bunhine0452/lazymemo) 의 Homebrew 탭.

```sh
brew tap bunhine0452/lazymemo
brew install --cask lazymemo
```

macOS 26 (Tahoe) 이상.

## 검역 딱지에 대해

lazymemo 는 **공증받지 않은 ad-hoc 서명 앱**이다. Homebrew 는 내려받은 것에 검역 딱지를 붙이고, macOS 15 부터는 우클릭-열기 우회가 사라져 딱지가 붙은 미공증 앱은 「손상되었다」며 열리지 않는다. 그래서 이 cask 는 설치 뒤에 딱지를 떼어 낸다.

**이것은 미봉책이다.** 옳은 답은 Developer ID 공증이고, 받는 즉시 이 동작은 사라진다.

믿을 수 없다면 **소스에서 직접 빌드하는 쪽이 1차 배포 경로다** — 그렇게 만든 앱에는 애초에 딱지가 붙지 않는다.

```sh
git clone https://github.com/bunhine0452/lazymemo.git
cd lazymemo && ./scripts/build-app.sh && open dist/LazyMemo.app
```
