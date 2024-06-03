
<img src="https://github.com/chasomin/MediaApp/assets/114223423/91808a11-d076-4208-af75-5e2b161cffcd" width=100, height=100>

# MediaApp

현재 인기 있는 미디어와 관련된 정보를 얻을 수 있는 앱

### **iOS 1인 개발**

### **기간**

24.01.30 ~ 24.02.09 (2주)

### **최소버전**

iOS 17.0


### **스크린샷**
<img src="https://github.com/chasomin/MediaApp/assets/114223423/ff3f2c3d-9627-43a1-ba3c-440944be375c" >


## 기능 소개

- 정렬된 미디어 리스트 제공
- 미디어 세부 정보 제공
- 비슷한 미디어 추천
- 미디어 검색
- 예고편 감상

## **기술**

`UIKit` `MVC` `Singleton` `URLSession` `UserDefaults` `Decodable` `CodeBaseUI` `SPM` `SnapKit` `Toast` `Kingfisher`


## **기술 설명**

 **Singleton** 패턴을 통해 불필요한 인스턴스 생성을 방지하여 리소스 절약

 enum **NameSpace**를 통해 literal 값을 캡슐화하여 유지보수에 용이한 코드 구현

 연산프로퍼티 getter, setter를 사용하여 UserDeafaults 관리

 **BaseView**를 사용하여 일관된 ViewController 구조 형성

 **CustomView**를 사용하여 동일한 디자인 패턴을 적용

 **automaticDimension**을 통한 Self-Sizing Cell 구성


## 기술 회고

UserDefaults 데이터 저장 및 관리를 손쉽게 하기 위해서 연산프로퍼티의 getter, setter를 사용했다.

```swift
final class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() { }
    
    enum UDKey: String {
        case search
    }
    
    let ud = UserDefaults.standard
    
    var search: [String] {
        get {
            ud.stringArray(forKey: UDKey.search.rawValue) ?? []
        }
        set {
            ud.setValue(newValue, forKey: UDKey.search.rawValue)
        }
    }
}
```
현재는 1개의 케이스에만 UserDefaults를 사용 중이지만, 더 많은 케이스를 저장한다면 get / set 코드가 반복된다.

✔️ 개선 방안

propertyWrapper를 사용하면 get / set 같은 보일러 플레이트 코드를 줄일 수 있다.

이후 프로젝트에서 propertyWrapper를 사용하여 UserDefaults를 효율적으로 관리해보면 좋을 것 같다.
