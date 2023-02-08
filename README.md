# 아마존 설정관련 팁

## 자바, 톰캣, 코드디플로이에이전트, 그외 기타 초기 설정 스크립트

> 톰캣은 직접 설정해주여야합니다!!!

- 스크립트 위치

1. /home/ec2-user에 dsda.sh, dsdaa.sh 위치시키기

- 명령어 입력

1. cd
2. chmod +x ./dsda.sh
3. ./dsda.sh
   > 톰캣은 직접 설정해주여야합니다!!!

## ami2 로컬 환경에서 테스트할때 이미지 구하는곳

<https://cdn.amazonlinux.com/os-images/latest/>

## AWS와 GitAction을 활용하여 CI CD 간단하게 구축하기

- IAM 설정

1. iam으로 갑니다.
   ![참고사진](https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/goto-iam.png)
2. 역할 -> 역할 만들기 클릭
   ![참고사진](https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/iam-menu.png)
   ![참고사진](https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/creating-role.png)
3. ec2역할부터 만들어보겠습니다
   ![참고사진](https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/role_ec2-1.png)
4. 사진의 권한을 선택하고 생성해줍니다.
   ![참고사진](https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/role_ec2-2.png)
5. code deploy역할을 만들어보겠습니다.
   ![참고사진](https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/role_codedeploy-1.png)
6. 사진의 권한을 이 자동으로 선택됩니다. 생성해줍니다.
   ![참고사진](https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/role_codedeploy-2.png)
7. 이번에는 "iam 역할"이 아닌 깃허브에서 사용할 "iam 사용자"를 생성하겠습니다.
   ![참고사진](https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/add_iam-user.png)
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(9).png>)
8. 직접정책연결을 누르고 사진의 정책들을 선택하여 생성해줍니다.
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(4).png>)
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(3).png>)
9. 만들어진 사용자를 클릭하고 보안자격증명을 눌러줍니다.
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(7).png>)
10. 액세스키 만들기를 누르고 생성된 키를 복사하거나 깃액션 시크릿에 넣어줍니다.
    ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(11).png>)
    ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(12).png>)

- S3 설정

1. CI CD용으로만 사용한다면 버킷이름과 지역만 제대로 설정해주면 됩니다.
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(16).png>)
2. 버킷이름은 복사하거나 깃액션 시크릿에 넣어줍니다.

- CodeDeploy 설정

1. 애플리케이션 생성해줍니다.
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(17).png>)
2. 만들어진 애플리케이션 이름을 복사하거나 깃액션 시크릿에 넣어줍니다.
3. 생성된 애플리케이션을 클릭합니다.
4. 배포그룹생성을 눌러줍니다.
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(18).png>)
5. 아까 만들어둔 역할로 지정해줍시다.
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(19).png>)
6. ec2인스턴스 태그를 지정해줍니다. (기본적으로 따로 설정하지 않아도 키중에 "Name" 있습니다.)
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(21).png>)
7. 로드밸런서등 기타 설정은 본인의 선택입니다.
8. 만들어진 배포그룹이름을 복사하거나 깃액션 시크릿에 넣어줍니다.

- EC2 설정 (초기설정 다 완료한상태일때)

1. ec2 인스턴스로 갑니다.
2. 인스턴스를 우클릭하고 iam 역할수정을 클릭하여줍니다.
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(14).png>)
3. 아까 만들어둔 역할로 지정하고 업데이트해줍니다.
   ![참고사진](https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/1231.png)

- 깃허브 시크릿 설정

1. 본인 repository로 가줍시다.
2. settings를 클릭합니다.
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/59eb90247e1bb81e7e7d2dec6d50decc1f24cb70/cicd/123%20(1).png>)
3. secrets and variables 클릭합니다.
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(22).png>)
4. actions을 클릭합니다.
5. new repository secret을 클릭합니다.
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(23).png>)
6. iam 사용자 생성할때 받았던 값을 Secret칸에 옮깁시다.
   ![참고사진](https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/312312.png)
7. 다른값들도 이런방식으로 시크릿등록 해주시면 됩니다.
   > (iam 액세스키 ,시크릿키 ,S3버킷이름 ,CodeDeploy애플리케이션이름 ,배포그룹이름)

- 깃허브 workflow 설정

1. 변수명: ${{ secrets.시크릿에 등록된 이름 }}
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(25).png>)
   > (변수명은 $변수명으로 사용합니다.)
2. $regionA는 시크릿값이 ap-northeast-2 입니다. 전역 환경변수로 등록하였습니다.
   ![참고사진](<https://github.com/nowon-kdt/aws-tips-and-tricks/blob/9873f4a937d58482f9e388f6ec8e1ceb5a91a808/cicd/123%20(26).png>)
   > $prj는 그냥 이름입니다. 시크릿에 등록해서 사용할필요 없으니 그냥 본인이 원하는대로 써줍시다(S3버킷의 폴더이름입니다.)

- appspec및 스크립트

1. 선생님이 만들어준거 본인 환경에 맞게 수정해서 씁시다.
