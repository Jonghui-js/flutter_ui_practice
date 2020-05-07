# paint_app_0507

<div>
<img src="image/project1day1ui_0507.gif" width="300px">
</div>

## 배운 점

- container에 배경색 설정하려면,

```dart
decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ))
```

- backgroundColor 이런거 없음.
- crossAxisAlignment, mainAxisAlignment는 Row, Column의 프로퍼티다. Contariner 등에 적용 X
- onPressed가 기본적으로 회색으로 설정되는데 그거 제거하기.

```dart
 onPressed: () {
                        setState(() {
                          points.clear();
                        });
                        //회색 제거
                      },
```
