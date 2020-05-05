# bookapp_0505

<div>
<img src="image/project1day1ui_0505.gif" width="300px">
</div>

## 알게된 것들

- Spacer() 가능한 모든 공간을 차지한다.

```dart
Image.asset("assets/banner.png",fit: BoxFit.fitWidth),
```

- BoxFit.fitWidth는 주어진 width에 맞추어서 이미지를 자름. 오버플로우 상관 안하고 width 기준!
- 양 옆으로 16 패딩값을 제외한 모든 width가 주어지면 그만큼 이미지를 자름.
- BoxFit.cover 는 주어진 가로세로에서 최대한 빈공간이 없게 이미지를 꽉채움. 그니까, 빈공간이 없어질때까지 최대한 확대시킨다고 생각하면 됨.
- BoxFit.contain 은 이미지 전체가 다 보여지는게 1순위임.
- MediaQuery.of(context).size.width : 스크린 사이즈 정보를 가져온다.

### 유튜브 채널

[Sanskar Tiwari](https://www.youtube.com/watch?v=Zz0IKZBnk_Y)
