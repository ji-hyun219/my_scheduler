# my_scheduler

캘린더와 할 일을 기록하는 실제 사용을 위한 앱을 만들고 있습니다.

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

# 왜 데이터가 초기화될까

1. RAM 은 빠르지만 장기적으로 데이터를 유지할 수 없다.
2. HDD/SSD(보조기억장치들)는 느리지만 장기적으로 데이터를 유지할 수 있다.

## SQL 을 사용한 실행 Flow

기존 앱 실행 Flow :
| HDD | ------------ | RAM |

1.

- HDD

```dart
Container(color : Colors.back);
```

`setState 사용`해서 `검정 -> 블루` 로 교체

- RAM

```dart
Container(color: Colors.blue);
```

하지만 여전히 HDD 는

```dart
Container(color : Colors.back);
```

이 상태로 존재하고 있으므로, 앱을 재실행하면 다시 검정으로 나타나게 된다.

그래서 이번 프로젝트는 `SQL 을 사용`할 것이다.

# SQL 기본 문법 정리

1. update 문법 : `UPDATE {table} SET {column} WHERE {condition}`

- 예시

```mysql
UPDATE players SET gender = 'F' WHERE name = '곽윤기'
```

2. delete 문법 : `DELETE FROM {table} WHERE {condition}`

- 예시

```mysql
DELETE FROM players WHERE gender = 'F'
```

gender 가 F 인 ROW 다 삭제됨

3. insert 문법 : `INSERT INTO {table} {column1, column2 ...} VALUES {value1, value2 ...}`

```mysql
INSERT INTO players (id, name, gender) VALUES (11, '진선유', 'F')
```

4. join 문법 : `SELECT {column} FROM {table} INNER JOIN {other_table} ON {condition}`

- `many to one` : (ex) 한 선수가 한 종목에만 출전할 경우를 예시로 들어보면, `1000 미터의 best_score 는 650점`이란 데이터가 계속 중복이 될 때 --> identity 가 있는 테이블(= 트랙 테이블)을 생성해야함
- 이것을 바로 `normalizaion 정규화` 라고 함
- players 테이블의 track_id 는 여러개 가지고 있고, track 테이블의 id 는 유니크함

```mysql
SELECT player.id, player.name, player.gender, track.length, track.best_score FROM player INNER JOIN track ON player.track_id = track.id
```

- `many to many` : (ex) 만약 한 선수가 여러 종목에 출전한다면? --> 선수 id 와 트랙 id 를 연결한 테이블을 하나 더 생성 --> INNER JOIN 두 번 사용

```mysql
SELECT player.name, track.length FROM player_track INNER JOIN player ON player_track.player_id = player.id INNER JOIN track ON player_track.track_id = track.id
```

# path_provider

Joins the given path parts into a single path using the current platform's [separator].
Example:

```dart
p.join('path', 'to', 'foo'); // -> 'path/to/foo'
```

If any part ends in a path separator, then a redundant separator will not be added:

```dart
p.join('path/', 'to', 'foo'); // -> 'path/to/foo
```

If a part is an absolute path, then anything before that will be ignored:

```dart
p.join('path', '/to', 'foo'); // -> '/to/foo'
```
