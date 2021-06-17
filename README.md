# 회원가입 화면
<!-- 뱃지 라인 -->
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FKyungminLeeDev%2FiOS_SignUp_Flow&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

| 📺 데모 | 💡 개요 |
| ------- | ------- |
| <img src = ./Images/SignUpFlow_Demo.gif width="250px"> | 🚀 회원가입하는 절차와 화면 구현 <br> 🧑🏻‍💻 팀 프로젝트: `Jacob`, [`Glenn`](https://github.com/iluxsm) <br> 🗓 진행 기간: 2020.11.30 ~ 12.06 (1주) <br> ⚙️ 기능 <br> &nbsp;&nbsp;&nbsp;&nbsp; `기타 영역 터치 시 키보드 내리기` <br> &nbsp;&nbsp;&nbsp;&nbsp; `다음 텍스트필드로 커서 이동` <br> &nbsp;&nbsp;&nbsp;&nbsp; `사진첩에서 프사 가져오기` <br> &nbsp;&nbsp;&nbsp;&nbsp; `개인 정보 입력 확인` <br> &nbsp;&nbsp;&nbsp;&nbsp; `전화번호 확인` <br> &nbsp;&nbsp;&nbsp;&nbsp; `개인 정보 임시 저장` <br> 📝 학습 키워드 <br> &nbsp;&nbsp;&nbsp;&nbsp; `Navigation Controller` <br> &nbsp;&nbsp;&nbsp;&nbsp; `Text Field` <br> &nbsp;&nbsp;&nbsp;&nbsp; `Text View` <br> &nbsp;&nbsp;&nbsp;&nbsp; `Image Picker` <br> &nbsp;&nbsp;&nbsp;&nbsp; `Date Picker` <br> &nbsp;&nbsp;&nbsp;&nbsp; `Gesture Recognizer` <br> &nbsp;&nbsp;&nbsp;&nbsp; `Singleton` |

<br><br><br>

## 목차

1. [프로젝트](#프로젝트)
    - [기능](#기능)
    - [팀원과 역할 분배](#팀원과-역할-분배)
    - [Git & GitHub으로 협업하기](#Git--GitHub으로-협업하기)
    - [팀 그라운드 룰](#팀-그라운드-룰)
    - [TWL](#This-week-We-Learned)
2. [학습 내용](#학습-내용)
    - [싱글턴 패턴으로 데이터 공유](#싱글턴-패턴으로-데이터-공유)
    - [Image View 터치 시 Image Picker 띄우기](#Image-View-터치-시-Image-Picker-띄우기)
    - [Image Picker Controller로 사진첩에서 사진 가져오기](#Image-Picker-Controller로-사진첩에서-사진-가져오기)
    - [Date Picker로 날짜 정보 가져오기](#Date-Picker로-날짜-정보-가져오기)
    - [Segue로 모달 화면 띄우기](#Segue로-모달-화면-띄우기)
    - [Navigaion Controller 추가하기](#Navigaion-Controller-추가하기)
3. [배운 내용](#배운-내용)
    - [if vs guard](#if-vs-guard)
4. [고민한 내용](#고민한-내용)
    - [싱글턴 클래스의 인스턴스 프로퍼티 이름](#싱글턴-클래스의-인스턴스-프로퍼티-이름)
    - [모달 vs 내비게이션](#모달-vs-내비게이션)
    - [키보드 내리는 방법 선택](#키보드-내리는-방법-선택)

<br><br><br>


## 프로젝트

- 회원가입하는 절차와 화면 구현
- 진행 기간: 2020.11.30~12.06 (1주)

### 기능

| 📺 데모 |  🗓 기능 |
| ------- | -------- |
| <img src = ./Images/SignUpFlow_HideKeyboard.gif width="250px"> | **기타 영역 터치시 키보드 내리기** <br><br> 1. `Text Field`를 터치하면 문자 입력을 위한 키보드가 올라온다 <br> 2. `Text Field`외에 기타 영역을 터치하면 키보드가 내려간다 |
| <img src = ./Images/SignUpFlow_MoveKeyboard.gif width="250px"> | **다음 텍스트필드로 커서 이동** <br><br> 1. `Text Field`에 정보 입력 <br> 2. `Next`키를 누르면 다음 `Text Field`로 커서가 이동하여 입력을 계속할 수 있다 |
| <img src = ./Images/SignUpFlow_SelectPhoto.gif width="250px"> | **사진첩에서 프로필 사진 가져오기** <br><br> 1. 프로필 사진 `Image View`를 터치하면 `Image Picker Controller`를 띄운다 <br> 2. 프로필 사진으로 가져올 사진을 선택한다 <br> 3. 사진의 크기 및 위치를 조절한다 <br> 4. `Choose`를 누르면 편집된 프로필 사진이 `Image View`에 보인다 |
| <img src = ./Images/SignUpFlow_CheckInfo.gif width="250px"> | **개인 정보 입력 확인** <br><br> 1. `다음 버튼`은 기본적으로 비활성화 <br> 2. 회원가입을 위한 모든 정보가 입력됐고, 비밀번호가 동일하면 `다음 버튼` 활성화 |
| <img src = ./Images/SignUpFlow_CheckPhoneNumber.gif width="250px"> | **전화번호 확인** <br><br> 1. 입력한 전화번호가 규칙에 맞는지 확인 <br> 2. 일치하면 키보드 내리기 <br> 3. 일치하지 않으면 에러 표시하여 수정하도록 유도 | 
| <img src = ./Images/SignUpFlow_SaveTempData.gif width="250px"> | **개인 정보 임시 저장** <br><br> 이전 화면으로 돌아가도 현재 화면의 정보가 지워지지 않고 임시로 유지됨 |

[👆목차로 가기](#목차)
<br><br><br>



### 팀원과 역할 분배

- `Jacob`, [`Glenn`](https://github.com/iluxsm)
- **역할을 나누지 않고 각자의 방법대로 구현한 후, 리뷰를 통해 더 나은 코드로 통합하기**  
    프로젝트 진행 방식에 대해 논의한 결과, 빠른 기능 구현보다는 iOS의 많은 것을 직접 구현해보고 서로 비교하여 더 나은 방식으로 통합하는 것이 좋다고 판단했다.

### Git & GitHub으로 협업하기

Git과 GitHub으로 협업하기 위환 최소한의 규칙을 정하고 지키기 위해 노력하기로 했다.  
- 각자 구현하기로한 부분이 완료되면 PR을 통해 리뷰하고 머지하기
- 팀 그라운드 룰로 정한 규칙 위주로 점검하고 의견 말하기


[👆목차로 가기](#목차)
<br><br><br>

### 팀 그라운드 룰

- 우리 팀만의 규칙
    - 공부시간: 오전 11시 ~ 오후 9시
    - 교육시간 외에는 회의실에서 같이 진행
    - 연락은 아무때나 해도 된다
    - 오랜시간 자리를 비우게 될 때는 얘기해준다
- 스크럼 주제
    - 오전 11시에 스크럼 하기
    - 어제 하기로 한 것 중에 못한 것 이야기
    - 오늘 할 일 위주로 이야기하기

#### 프로젝트 규칙

- 브랜치 이름
    - 스텝별로 공동 브랜치 생성 "step-1", 개인 브랜치 "step-1-닉네임-기능". 
    - ex) step-1-jacob-feature
- 커밋 단위
    - func 하나 단위로는 꼭 커밋 해주기(최대한 자주)
    - 실행 가능한 상태에서 커밋 하기
- 코딩 컨벤션
    - Swift API 디자인 가이드라인을 따르려고 노력한다
    - 클래스, 함수, 변수 명을 명확하고 객관적인 이름으로 하기
    - 주석 필요한 경우 간단 명료하게
- PR
    - 각자 기능이 완성되면 step별 브랜치로 PR 보내고 코드리뷰 후 머지한다. 
    - step별 브랜치 완료되면 야곰 저장소로 PR한다.

#### 커밋 메시지 규칙

- 한글로 작성하기 (단, 제목의 Type은 영문으로 작성)
- 제목작성 Type : 제목
    - Feat : 코드, 새로운 기능 추가
    - Fix : 버그 수정
    - Docs : 문서 수정
    - Style : 코드 스타일 변경 (기능, 로직 변경 x)
    - Test : 테스트 관련
    - Refactor : 코드 리팩토링
- title은 간단하게 description은 자세히! 
    - 간단한 경우에는 description 없어도 됨



[👆목차로 가기](#목차)
<br><br><br>

### This week We Learned

팀 주간 회고
- 2020.12.05 금요일 작성

#### 타임 라인

| 요일 | 내용 | 
| :--: | :--- |
| 월   | UML 강의 (리뷰어 흰), 팀 그라운드 룰 정하기 |
| 화   | Step 1 진행 및 PR |
| 수   | SOLID 강의 (리뷰어 붱이), Step 2 진행 및 PR |
| 목   | Step 3 진행 및 PR |
| 금   | Step 4 진행 및 PR |

#### 잘한 점 

- 매일 스크럼 시간에 함께 정한 목표를 지키기 위해 노력했고, 모두 지킬 수 있었다.
- 서로의 의견을 잘 얘기하고 들으려고 노력했다.
- GitHub로 협업하려고 노력했다.

#### 개선할 점 

- 11부터 9시까지의 학습시간을 지키지 못하는 경우가 있었다.
- 강의에 참여하기 전에 예습을 많이 하지 않았다. 예습을 제대로 하고 참여하면 더 얻어 갈게 많았을 것 같다.

#### 학습 키워드

- UML
- SOLID 원칙
- UIImagePicker 사용
- UIDatePicker 사용
- Singleton 구현
- AppDelegate, SceneDelegate

#### 칭찬하기

- Jacob이 Glenn에게: 글렌은 제가 놓치거나 생각하지 못했던 것들을 잘 발견해 주어서 실수를 많이 방지할 수 있었습니다. 또, 제가 해보고 싶은 방식을 지지해 주면서 더 나은 방법도 잘 제시해 주어 프로젝트를 수월하게 진행할 수 있었습니다. 감사합니다.

- Glenn이 Jacob에게: 팀원을 배려해 주는 모습과 항상 차분하고 침착하게 문제를 해결해 나가는 모습을 보고 많은 걸 느꼈어요. 그리고 코드를 작성할 때 생각이 미치지 못하는 부분을 세세하게 체크해 줬고, 스스로에게 왜 이걸 이렇게 썼을까라는 질문을 자주 하게 만들어 줬어요. 감사합니다.

[👆목차로 가기](#목차)
<br><br><br>



## 학습 내용

### 싱글턴 패턴으로 데이터 공유

회원가입 절차가 여러 화면으로 이루어져 있어서 화면 전환 시에도 이미 입력한 사용자 정보를 저장할 타입이 필요했다.  
이를 위해 사용자 정보 저장 용도의 객체를 싱글턴 패턴으로 만들어서 하나의 인스턴스를 공용으로 사용하게 구현했다.

#### 싱글턴 패턴 구현

~~~swift
class UserInformation {
    static let card = UserInformation()

    var id: String?
    var password: String?
    ...


    private init() {}
}
~~~

싱글턴 패턴은 하나의 인스턴스를 보장해야하므로 인스턴스를 생성할수 없도록 생성자에 private 접근제한을 건다.  
  
싱글터 인스턴스는 `UserInformation.card`로 접근할 수 있으며, static 이므로 최초 접근 시에 인스턴스가 생성되며 이후에는 생성된 인스턴스를 제공한다.

[👆목차로 가기](#목차)
<br><br><br>



### Image View 터치 시 Image Picker 띄우기

프로필 사진 이미지 뷰를 터치하면 이미지 피커를 띄워서 사진을 선택하는 기능을 구현하려 한다.  
이미지 뷰는 버튼과 다르게 터치 액션을 만들 수 없다.  
  
이미지 뷰의 터치를 인식해서 특정 메서드가 실행되도록 `UITapGestureRecognizer`를 사용해서 구현했다.

#### 프로필 이미지 뷰에 탭 제스처 등록하기

탭 제스처가 인식되면 `showImagePicker()`가 호출되는 `UITapGestureRecognizer`를 Target-Action 패턴으로 생성하고 프로필 이미지 뷰의 Gesture Recognizer에 추가한다.

~~~swift
let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showImagePicker))
profileImage.addGestureRecognizer(tapGesture)
profileImage.isUserInteractionEnabled = true
~~~

#### 이미지 피커 컨트롤러 띄우기

위에서 탭 제스처 인식기에 등록한 메서드를 구현한다.  
Target-Action 패턴으로 액션 메서드를 등록하려면 메서드에 `@objc` 를 붙여야 한다.  
  
이제 이미지 뷰를 터치하면 이 메서드가 호출되어 이미지 피커 컨트롤러를 present 한다.

~~~swift
@objc private func showImagePicker() {
    imagePickerController.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
    imagePickerController.allowsEditing = true
    
    self.present(imagePickerController, animated: true, completion: nil)
}
~~~

[👆목차로 가기](#목차)
<br><br><br>



### Image Picker Controller로 사진첩에서 사진 가져오기

이미지 피커에서 이미지를 선택하면, 이미지를 가져오고 이미지 피커 화면을 내리기 위해 `UIImagePickerControllerDelegate`의 `imagePickerController(_:didFinishPickingMediaWithInfo:)` 메서드를 사용한다.  
이 메서드는 이미지 피커에서 이미지 선택이 완료되면 호출되는 델리게이트 메서드다.  
  
선택한 이미지 원본이 아닌 편집된 사진을 가져오기위해 `info[UIImagePickerController.InfoKey.editedImage]`로 접근한다.  
사진을 이미지 뷰로 가져왔으면 `dismiss`로 이미지 피커 컨트롤러 화면을 내린다.


~~~swift
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
        profileImage.image = selectedImage
    }
    
    dismiss(animated: true, completion: nil)
}
~~~

[👆목차로 가기](#목차)
<br><br><br>



### Date Picker로 날짜 정보 가져오기

Date Picker로 날짜를 선택할 때 마다 바로 날짜 정보를 가져와서 반영하기 위해 
Target-Action 패턴으로 Date Picker의 값이 변경될 때 마다 `didDatePickerValueChanged()`가 호출되도록 등록한다.  
  
~~~swift
func setupDatePicker() {
    birthDatePicker.addTarget(self, action: #selector(didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
    birthDatePicker.maximumDate = Date()
}
~~~

생년월일을 적는 곳이므로 오늘 날짜를 최댓값으로 등록한다.

~~~swift
@objc func didDatePickerValueChanged(_ sender: UIDatePicker) {
    updateDateLabelFromDatePicker(sender)
}
~~~

Date Picker로 선태한 Date 타입의 날짜정보를 dateFormatter를 이용해 String 타입으로 변환하여 Label에 표시해준다.

~~~swift
func updateDateLabelFromDatePicker(_ sender: UIDatePicker) {
    let dateString: String = dateFormatter.string(from: sender.date)
    birthDateLabel.text = dateString
}
~~~

[👆목차로 가기](#목차)
<br><br><br>


### Segue로 모달 화면 띄우기

`Sign Up` 버튼을 누르면 회원가입을 화면을 모달로 띄웠다.  
  
스토리보드의 `Sign Up`버튼을 누르고 `control`버튼을 누른채로 띄우려는 화면으로 드래그 앤 드랍하여 Action Segue 등록 창에서 Present Modally를 선택하면 연결된다.  
  
여기서는 내비게이션 컨트롤러 자체를 모달로 띄웠다.  

<img src = ./Images/Segue_PresentModally.png width="600px">

[👆목차로 가기](#목차)
<br><br><br>



### Navigaion Controller 추가하기

스토리보드에서 Navigaion Controller를 추가하려는 View Controller을 선택한 후 메뉴바의 Editor -> Embed In -> Navigation Controller을 선택하면 추가된다.

<img src = ./Images/EmbedIn_NavigationController.png width="600px">

[👆목차로 가기](#목차)
<br><br><br>



## 배운 내용

### if vs guard

#### - 배경

Swift의 조건문에는 다른 언어와 다르게 `if`에 더해서 `guard`가 있고, if or guard를 선택하는 나의 기준이 있었다.  
`guard`라는 명칭이 방어하고 미리 막는 느낌이 강해서, 로직상 잘못된 부분이나 미리 걸러야 하는 것을 처리할 때 guard를 주로 사용했다.

#### - 코드 리뷰 [코멘트](https://github.com/yagom-academy/ios-signup-flow/pull/26/files/56489274eea82e0135abe4be2d276a6eb88f91cd#r535812747)  

코드 리뷰에서 아래 코멘트를 받고 어떤 상황에서 if 또는 guard를 사용할지 다시 생각해 보았다.  
![](./Images/CodeReview_IfGuard.png)

#### - 개선  

수정한 코드 예시
~~~swift
private var isValidProfileImage: Bool {
    if let _ = profileImage.image {
        return true
    } else {
        return false
    }
}
~~~

[피드백 코멘트](https://github.com/yagom-academy/ios-signup-flow/pull/26#issuecomment-738673080)  
![](./Images/CodeReview_IfGuard_Answer.png)

#### - 배운 점  
if or guard 선택할 때, 만약 회사나 팀에 규칙 있다면 그 기준을 지키면 될 것이다.  
하지만 규칙이 없다면 개인의 규칙을 만들어야 할 것이고,  
초심자에게 그 기준은 코드가 좀 더 자연스럽게 읽힐 수 있는 방향으로 하는 것이 좋을 것 같다.  
나는 로직상 잘못된 부분이나 미리 걸러야 하는 부분에 guard를 사용한다는 나름이 규칙을 정했지만,  
이것을 지키려다 보니 가독성을 해치는 경우를 발견할 수 있었다.  
예를 들면 조건문의 결과가 주로 false가 되는 상황이라면 guard가 더 이해하기 어렵다.  
guard에는 true 조건을 작성해야하기에 이를 맞추기려면 Bool값을 반전해서 한번 더 생각하기에 그렇다.  

~~~swift
// if-else
// 패스워드가 비어있다면 false
if password.isEmpty  { 
    return false
} else {
    return true
}
// guard-else
// 패스워드가 비어있지 않다면?! false
guard !password.isEmpty else {
    return false
}
return true
~~~

guard를 사용한다면 `password.isEmpty`를 한번 뒤집어야 하니 제대로 이해하기 위해 한번 더 생각해야하고, 이부분에서 실수했던 기억이있다.

#### - 공식문서 확인

[Swift Language Guide - Control Flow](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html) 문서의 `Early Exit`토픽에서 guard 사용 관련 내용을 확인할 수 있다.
> Using a guard statement for requirements improves the readability of your code, compared to doing the same check with an ifstatement. It lets you write the code that’s typically executed without wrapping it in an else block, and it lets you keep thecode that handles a violated requirement next to the requirement.  
  
조건문에 guard를 사용하면 일반적으로 실행되는 코드를 블록으로 감싸지 않고 사용할 수 있고, 조건을 위반하는 경우를 처리하는 코드를조건문 옆에 둘 수 있으므로 가독성이 향상될 수 있다는 내용이다.  
  
이번 경우와는 결이 살짝 다르게 느껴지지만, guard를 사용하는 것이 if 보다 가독성이 좋게 만드는 경우가 있다는 것을 배웠다.

[👆목차로 가기](#목차)
<br><br><br>



## 고민한 내용

### 싱글턴 클래스의 인스턴스 프로퍼티 이름

#### - 배경

사용자 정보 저장할 타입을 싱글턴 패턴으로 구현할 때, 인스턴스를 저장할 프로퍼티의 이름을 무엇으로 할지 고민했다.

처음에는 별 생각없이 보통 공유라는 의미의 `shared`를 사용하는 것 같아 그대로 사용하려 했지만,  
학습활동시간에 싱글턴 인스턴스의 이름을 shared, default 등 자주 사용되는 이름은 보안에 취약할 수 있어서  
회사나 팀마다 다른 용어를 사용하는 경우가 있다는 것을 알게 되어 고민해보기로 했다. 

#### - 과정

먼저 iOS 라이브러리의 싱글턴 인스턴스이름을 찾아보았다

~~~swift
UserDefaults.standard
UIApplication.shared
FileManager.default
NotificationCenter.default
~~~

shared, default 등의 예상할 수 있는 단어가 많이 쓰이는데 이건 보안에 관계가 없나? 
이건 어차피 iOS 지원하는 라이브러리이고, 해커라면 개발자가 작성한 코드에 관심이 있을 것이므로 다르다는 것인가?

정확히는 모르겠지만 자주 사용하는 것이 아닌 단어를 생각해 보기로 했다.

#### - 결론

유저정보 `카드`라는 의미로 `card`라고 결정했다.
최대한 유저정보와 관련 없는 단어이면서 조금은 관련이 있어야 한다는 생각으로 지었는데, 
지금 생각해 보니 만약 다른 개발자가 본다면 전혀 유추할 수 없는 단어라고도 생각된다.
현업에서는 어떻게 작명하는지 나중에 꼭 물어보고 싶다.

- 해당 [PR](https://github.com/yagom-academy/ios-signup-flow/pull/13)
![](./Images/PR_Step1.png)

[👆목차로 가기](#목차)
<br><br><br>



### 모달 vs 내비게이션

로그인 화면에서 회원가입 화면으로의 화면 이동을 구현할 때, 모달로 해야할까? 내비게이션으로 해야할까?

먼저 H.I.G 문서를 통해 모달과 내비게이션에 대해 알아보았다.

#### - H.I.G - [Modality](https://developer.apple.com/design/human-interface-guidelines/ios/app-architecture/modality/)

> Modality is a design technique that presents content in a temporary mode that’s separate from the user's previous current context and requires an explicit action to exit. Presenting content modally can:
> - Help people focus on a self-contained task or set of closely related options
> - Ensure that people receive and, if necessary, act on critical information

모달은 이전의 컨텍스트와는 별개로 임시적인 컨텐츠를 보여줄때 사용하는 방법이라고 해석된다. 
즉, 현재의 맥락과는 다르게 일시적으로 사용자의 주의를 끌어서 스스로 작업해야하는 컨텐츠를 보여줄대 사용되는 것 같다.

#### - H.I.G - [Navigation](https://developer.apple.com/design/human-interface-guidelines/ios/app-architecture/navigation/)

> People tend to be unaware of an app’s navigation until it doesn’t meet their expectations. Your job is to implement navigation in a way that supports the structure and purpose of your app without calling attention to itself. Navigation should feel natural and familiar, and shouldn’t dominate the interface or draw focus away from content. In iOS, there are three main styles of navigation.

사용자가 자연스럽게 앱의 컨텐츠 흐름을 느끼도록 내비게이션 되야 한다고 설명하고 있다.
앱의 구조에 맞게 컨텐츠의 맥락에 따라 더 깊은 컨텐츠 화면으로 들어가거나 나오는게 자연스럽게 이어저야 한다.

#### - 고민한 점

1. 로그인 화면에서 회원가입 화면으로 이동은?  
    로그인 화면에서 로그인을 하고 앱의 컨텐츠로 진입하는 것이라면, 그것이 자연스운 경로이므로 `내비게이션`일 것이다.  
    하지만 로그인 화면에서 회원가입 화면으로의 이동은 앱의 흐름과 별개로 서비스에 가입해야 한다는 새롭고 임시적인 내용이므로 다른 화면이며, 화면의 변환도 이를 인지할 수 있도록 `모달`로 구현해야 맞다고 생각했다.
2. 회원가입 화면내에서의 화면 이동은?  
    회원가입 화면이 두개의 화면으로 이루어지며 첫 화면에서 아이디, 비밀번호 등을 입력 후 더 자세한 개인정보를 입력하는 화면으로 이동한다. 이때 두 화면은 서로 관계있는 화면의 컨텐츠가 동일한 레벨이거나 더 깊은 레벨의 컨텐츠 이므로 `내비게이션`으로 구현해야 한다.

#### - 결론

![](./Images/Storyboard.png)

스토리보드로 모달과 내비게이션을 활용하여 구현했다.  
회원가입 화면은 내비게이션 컨트롤러를 삽입하여 자동으로 내비게이션을 구현했고, 로그인 화면에서 내비게이션 컨트롤러를 모달로 띄우도록 구현했다.  
  
화면의 흐름: Sign Up 버튼을 누르면 모달로 회원가입 화면이 띄워진다.  
아이디 비밀번호 등의 정보 입력후 다음 버튼을 누르면 내비게이션으로 다음 개인정보 입력 화면으로 이동한다.

[👆목차로 가기](#목차)
<br><br><br>



### 키보드 내리는 방법 선택

#### - 배경

`기타 영역 터치 시 키보드 내리기`기능을 각자 구현하고 코드 리뷰를 진행했는데, 나와 글렌이 완전히 다른 방식을 사용했다.
내가 사용한 방법 외에 다른 방법이 있는지도 몰랐는데, 글렌이 사용한 방식이 더 간단하게 구현한 코드라서 흥미로웠다.

#### - Gesture Recognizer 사용하는 방법

~~~swift 
override func viewDidLoad() {
    super.viewDidLoad()
    setupGestureRecognizer()
}

func setupGestureRecognizer() {
    let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tappedView(_:)))
    view.addGestureRecognizer(tapGesture)
}

@IBAction func tappedView(_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
}
~~~

내가 구현한 방식은 Gesture Recognizer를 사용한 것이다.
ViewController의 view에 UITapGestureRecognizer를 추가해서 입력 UI가 아니라 view가 터치되면 veiw.endEditing()으로 키보드를 내리도록 구현했다.

#### - UIResponder - touchesBegan(_:with:) 사용하는 방법

~~~swift
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    
    view.endEditing(true)
}
~~~

글렌은 위 코드만으로 기능 구현을 했다.  
UIResponder의 touchesBegan(_:with:)은 해당 객체에 터치가 시작되면 호출된다.  
여기서 해당 객체는 ViewController이므로 view가 터치되면 veiw.endEditing()으로 키보드를 내린다.

#### - Gesture Recognizer vs touchesBegan

글렌과 두가지 방식을 비교하고 정리했다.

| 장단점 | Gesture Recognizer | touchesBegan |
| ------ | ------------------ | ------------ | 
| 장점   | 다양한 터치 제스처를 처리할 수 있다 | 간단하게 구현 가능, Gesture Recognizer 보다 인식 빠름 |
| 단점   | touchesBegan보다는 인식이 느리다 <br> (동시에 구현한 경우 touchesBegan이 먼저 호출됨) | Gesture Recognizer보다 인식하는 제스처가 적다 |

#### - 결론

논의 결과 touchesBegan 방식을 사용하기로 했다.
프로젝트의 해당 기능에서는 다른 제스처가 필요하지 않아 터치만 인식하면 되고,  
Gesture Recognizer 보다 인식이 빠르고 구현이 간단해서 이해하기 쉬운 코드라고 판단했다.

- 해당 [PR](https://github.com/yagom-academy/ios-signup-flow/pull/18)
![](./Images/PR_Step2.png)

[👆목차로 가기](#목차)
<br><br><br>
