# ami2-ec2-cicd-init-scripts
## 자바, 톰캣, 코드디플로이에이전트, 그외 기타 초기 설정 스크립트

## 사용법
- /home/ec2-user에 dsda.sh,dsdaa.sh 놓기


 </br> 아래 명령어 입력
- cd 
- chmod +x ./dsda.sh
- sudo ./dsda.sh
### dsdaa.sh는 직접 실행하는거 아니에요!

## 코드 디플로이 에이전트 설치되는 버전 선택...
1. [둘중에 하나는 주석처리(1)](https://github.com/nowon-kdt/ami2-ec2-cicd-init-scripts/blob/69f07e843057462df08cce5f09e326d4395e5c3a/sc/dsda.sh#L63)
2. [둘중에 하나는 주석처리(2)](https://github.com/nowon-kdt/ami2-ec2-cicd-init-scripts/blob/69f07e843057462df08cce5f09e326d4395e5c3a/sc/dsda.sh#L67)
</br> 기본적으로 1번이 실행됨

## ami2 로컬 환경에서 테스트할때
 https://cdn.amazonlinux.com/os-images/latest/
