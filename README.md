# my_scheduler

캘린더와 할 일을 기록하는 실제 사용을 위한 앱을 만들고 있습니다.

# widget.\*\*\*

setter 로 설정되어 있을 때 widget 으로 접근
반면, this 는 state 로 관리될 때 this 로 접근

# getter, setter 사용하는 이유

데이터를 보호하기 위해 사용한다. (특히 클래스를 생성할 때)

# positional optional parameter

```dart
DateTime DateTime(
  int year, [
  int month = 1,
  int day = 1,
  int hour = 0,
  int minute = 0,
  int second = 0,
  int millisecond = 0,
  int microsecond = 0,
])
```

# IntrinsicHeight

IntrinsicHeight 위젯 은 자식의 고유 높이에 맞게 자식 크기를 조정하는 위젯입니다.

무제한 높이를 사용할 수 있고 사용자가 더 합리적인 높이로 크기를 조정하기 위해 무한 확장을 시도하는 자식을 원하는 경우 사용자는 IntrinsicHeight 를 사용할 수 있습니다.

사용자가 Row Widget 또는 Column Widget 내부의 모든 위젯 을 가장 높은 위젯만큼 높이길 원할 때 IntrinsicHeight Widget을 사용할 수 있습니다.

```dart
IntrinsicHeight({
  Key key,
  Widget child,
});
```

- `key` : 교체해야 하는지 여부를 제어하는 ​​데 사용되는 위젯 키입니다.
- `child` : 자식 속성은 트리의 현재 위젯 아래에 있는 위젯을 나타냅니다. 자식 위젯에는 자식이 하나만 있습니다. 사용자에게 여러 자식 사용자는 Column Widget , Row Widget , Stack Widget 을 사용하고 해당 위젯에 자식을 제공할 수 있습니다.

# ListView.builder

```dart
  ListView.builder(
    itemCount: 3,
    itemBuilder: (context, index) {
      return Container();
    }
  )
```

이렇게만 쓰면 `unbounded(무한한)` 에러가 난다.
자리를 얼마나 차지할지 모르기 때문이다.
따라서 이 위젯을 `Expanded` 로 감싸야 한다.
