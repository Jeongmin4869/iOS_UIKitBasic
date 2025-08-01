import UIKit

/*------------------------------------*/
/*       Scene Based Life Cycle       */
/*------------------------------------*/

/*

 Scene Delegate : iOS 13버전 이상, Scene 지원할 경우 화면과 관련된 라이프 사이클을 씬 델리게이트가 처리
                  앱 델리게이트는 어플리케이션 이벤트만 처리

 지도 앱을 두개 동시에 킬 경우
 -> 앱 자체는 1개만 실행 된 것이나 앱이 제공하는 화면을 개별 인스턴스로 표시
 -> 화면 인스턴스를 씬이라고 한다.
 -> 씬을 지원하는 앱은 두개 이상의 인스턴스를 동시에 지원할 수 있다.
 
 앱 델리게이트는 1개만 만들어진다. 왜 앱 델리게이트에서 화면 이벤트를 처리하지 않을까?
 -> 씬 2개가 액티브 상태라고 가정
    둘 중 하나가 inactive상태가 되면, 그 씬에서만 이벤트를 처리해야함.
    앱 델리게이트는 어떤 씬인지 구분하는 값이 없기 때문에 처리 불가
 -> 따라서 앱 델리게이트는 어플리케이션 이벤트만 처리하고
    씬마다 씬 델리게이트를 하나씩 만들어 해당 씬에서 발생하는 이벤트만 처리하도록 한다. 
 
 
 모든 Scene은 독립적인 라이프 사이클을 가지고 있다.
 여러개의 라이프 사이클이 동시에 존재할 수 있다.
 
 Unattached <-> Inactive <-> Active
    ↑ ↓       /       ↑ ↓
  Suspended  <->  Background
 
 Unattached : 앱이 실행되었고 씬도 만들어졌지만 아직 두 개가 연결되지 않은 상태
 
 Inactive : 앱과 씬이 연결되어 초기화 단계를 거치는 상태
 
 Active : 초기화 완료 된 후 첫번째 화면이 표시.
 
 Background : 작업은 실행중이나, 화면이 표시되지 않아 터치 이벤트는 받을 수 없는 상태
              Background에서 실행할 작업이 없다면 -> Suspended
 
 Suspended : 아무런 작업도 수행하지 않고 최소한의 리소스만 실행하며 일시중지된 상태
             완전히 종료된 것이 아니며, 다시 원래 상태로 돌아갈 수 있다 -> Inactive
 

 */
