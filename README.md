# my_scheduler

캘린더와 할 일을 기록하는 실제 사용을 위한 앱을 만들고 있습니다.

### widget.\*\*\*

setter 로 설정되어 있을 때 widget 으로 접근
반면, this 는 state 로 관리될 때 this 로 접근

### getter, setter 사용하는 이유

데이터를 보호하기 위해 사용한다. (특히 클래스를 생성할 때)

getter 는 인스턴

### widget

TableCalendar<T> get widget
package:flutter/src/widgets/framework.dart

The current configuration.

A [State] object's configuration is the corresponding [StatefulWidget] instance. This property is initialized by the framework before calling [initState]. If the parent updates this location in the tree to a new widget with the same [runtimeType] and [Widget.key] as the current configuration, the framework will update this property to refer to the new widget and then call [didUpdateWidget], passing the old configuration as an argument.
