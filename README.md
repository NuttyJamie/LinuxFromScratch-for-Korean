[![LFS logo](http://www.linuxfromscratch.org/images/lfs-logo.png)](http://linuxfromscratch.org)
# LinuxFromScratch-for-Korean
[**LinuxFromScratch**](http://linuxfromscratch.org) 프로젝트 가이드 한국어 번역판.

**다운로드:**
[**HTML-nochunk**](https://rawcdn.githack.com/NuttyJamie/LinuxFromScratch-for-Korean/5cbf2c23a2012e036c4ded0c9a08028eb5e7d131/9.1/BOOK/HTML-nochunks/LFS-BOOK.html) or 
[**HTML**](https://rawcdn.githack.com/NuttyJamie/LinuxFromScratch-for-Korean/5cbf2c23a2012e036c4ded0c9a08028eb5e7d131/9.1/BOOK/HTML/index.html) or 
[**PDF**](https://github.com/NuttyJamie/LinuxFromScratch-for-Korean/raw/master/9.1/BOOK/PDF/LFS-BOOK.pdf)

## 목차 
- [LinuxFromScratch 프로젝트 소개](https://github.com/NuttyJamie/LinuxFromScratch-for-Korean#linux-from-scratch%EB%8A%94)
- [번역 일러두기](https://github.com/NuttyJamie/LinuxFromScratch-for-Korean#%EB%B2%88%EC%97%AD-%EC%9D%BC%EB%9F%AC%EB%91%90%EA%B8%B0)
- [작업 현황](https://github.com/NuttyJamie/LinuxFromScratch-for-Korean#todo)
- [변경 사항](https://github.com/NuttyJamie/LinuxFromScratch-for-Korean#Changelog)

## Linux From Scratch는..
Linux From Scratch (이하 LFS)는 모든 것을 소스로부터 단계별로 빌드하여 자신만의 커스텀 리눅스 시스템을 만드는 프로젝트입니다.

## LFS 시스템의 장점은?
많은 사람들이 기존 리눅스 배포판을 다운로드 할 수 있는데 왜 리눅스 시스템을 처음부터 새로 빌드해야하는지 궁금해합니다. 그러나 LFS를 구축하면 다음과 같은 몇 가지 장점이 있습니다. 

- LFS는 리눅스 시스템이 내부적으로 어떻게 동작하는지 가르칩니다.
	LFS를 빌드하면 리눅스를 구성하는 모든것에 대해, 어떻게 작동하고 서로 의존하는지에 대해 알려줍니다. 그리고 가장 중요한 것은, 자신의 취향과 필요에 맞게 커스터마이징하는 것이죠.

- 아주 가벼운 리눅스 시스템을 빌드할 수 있습니다.
	정규 배포판을 설치할 때는 종종 사용하지 않는 많은 프로그램을 설치하게 됩니다. 그것들은 그저 귀중한 디스크 공간만 차지할 뿐이죠. 100MB 미만으로 LFS 시스템을 설치하는 것은 어려운 일이 아닙니다. 그래도 무거운 것 같나요? 우리 중 몇몇은 매우 작은 임베디드 LFS 시스템을 만들기 위해 노력 중입니다. 총 디스크 공간 사용량은 약 8MB입니다. 추가 스트리핑을 사용하면 5MB 이하로 줄일 수 있습니다. 이걸 정규 배포판으로 해보세요.

- LFS는 극단적으로 유연합니다.
	LFS 빌드는 집을 완성하는 것에 비유할 수 있습니다. LFS는 집의 골격을 제공 할 것이지만, 배관, 전기 콘센트, 주방, 욕실, 벽지 등을 설치하는 것은 당신에게 달렸습니다. 당신이 필요로 하는 어떤 시스템의 형태로든 당신을 위해 완전히 커스터마이징 할 수 있습니다. 

- LFS는 보안 면에서 더 안전합니다.
	모든 시스템을 소스부터 컴파일하기 때문에 원한다면 모든 것을 감시할 수 있고, 적용해야하거나 따로 원하는 보안 패치를 적용할 수 있습니다. 다른 사람이 보안 허점을 수정해서 내놓는(그러기나 하면 좋겠지만) 새 바이너리 패키지를 기다릴 필요가 없습니다. 사실, 보안 허점을 스스로 고치지 않는 한 정말 고쳐졌는지 알기도 어렵습니다.

## 내 LFS 시스템으로 뭘 할 수 있나요?
설명서에 따른 LFS 시스템은 굉장히 작지만, 원하는 패키지를 추가할 수 있는 강력한 기반을 제공하도록 설계되었습니다. 일반적으로 사용되는 패키지들을 추가하려면 [BLFS 프로젝트](http://www.linuxfromscratch.org/blfs/)를 참고하십시오.

<br>

## ※번역 일러두기

*이 번역판은 LFS 프로젝트 9.1 Current Stable버전을 기준으로, 모든 내용과 절차를 직접 테스트하며 작성되었습니다.*

- 원문에서의 저자의 의도를 가능한 그대로 전달하기 위해 노력했습니다. 
- 전문 번역가가 아닌 개인 프로젝트인 관계로 구글 번역기, 네이버 파파고 등 웹 번역 서비스의 도움을 많이 받았습니다. 다만 일부 오역이나 가독성 면에서 부자연스러운 문장들은 수정하고 다듬었습니다.
- 번역 일관성을 지키고 싶었으나, 혹시 검수에도 불구하고 통일되지 못한 표현이 간혹 있을 수 있습니다. 너그럽게 양해 부탁드립니다.
- 문맥 상 가독성을 위해 불가피하게 음차, 의역 등을 혼용한 어휘들이 있습니다. 
	- 가령 Compile, Build 과 같은 개발자 전문용어들은 되도록 *컴파일, 빌드*와 같이 발음 그대로 표기한 반면에, User와 같이 범용적인 어휘는 문맥에 따라 의역과 음차를 혼용하였습니다.
- 번역 누락이나 오역, 오타 등은 Github issue나 개인 메일(jongmie91@gmail.com)로 제보해주시면 검토 후 수정하겠습니다.

테스트 환경
- AMD Ryzen 5 2600 Processor
- DDR4 32Gb RAM
- ASUS B450M Mainboard
- NVIDIA GTX 1050 2G
- Slackware64-14.2 

## TODO
- [x] [LFS 번역 검수 진행 중 (2021-01-01~)](https://github.com/NuttyJamie/LinuxFromScratch-for-Korean/blob/master/TODO.md#table-of-contents)
- [ ] BLFS
- [ ] ALFS

## Changelog
- 2020-11-12    초안 완성
- 2020-12-27    프로젝트 라이센스 정정 (MIT -> CC-BY-NC-SA 2.0)
