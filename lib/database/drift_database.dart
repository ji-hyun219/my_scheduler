// import --> private 값들은 불러올 수 없다.
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../models/category_color.dart';
import '../models/schedule.dart';

import 'package:path/path.dart' as p;

// part --> private 값까지 불러올 수 있다.
part 'drift_database.g.dart';

@DriftDatabase(
  tables: [Schedules, CategoryColors], // drift 에게 이 테이블 쓸 것을 알려줌
)
class LocalDatabase extends _$LocalDatabase {
  // _$LocalDatabase 를 drift 가 만들어줌(drift_database.g.dart 에서)
  LocalDatabase() : super(_openConnection());

  // 아래
  // 스키마버전: 데이터베이스 테이블의 상태 버전
  // 데이터베이스 데이터가 바뀌는게 아니라 구조가 바뀔 때 (테이블의 구조가 바뀔 때!)
  // 스키마 버전을 올려줘야 한다. 1부터 시작하면 된다
  @override
  int get schemaVersion => 1;

  // 아래
  // drift 가 sql 을 전환하는 방식이라고 생각하면 된다
  // insert 한 primary key 를 반환해준다.
  Future<int> createSchedule(SchedulesCompanion data) => into(schedules).insert(data);

  Future<int> createCategoryColor(CategoryColorsCompanion data) => into(categoryColors).insert(data);

  Future<List<CategoryColor>> getCategoryColors() => select(categoryColors).get();

  LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      // sql 은 보조기억장치를 연결해준다고 했다.
      final dbFolder = await getApplicationDocumentsDirectory();
      // 이 위치는 앱을 설치하게 되면 AOS, IOS --> 앱 별로 각각 사용할 수 있는 위치를 지정해줌
      // 배정받은 위치를 가져오려면 getApplicatiohnCDocumentsDirectory 사용(path_provider)
      final file = File(p.join(dbFolder.path, 'db.sqlite')); // 데이터베이스 정보를 저장할 파일을 만들어주기
      // 디비 경로(dbFolder.path)를 지정하고 파일 이름은 db.sqlite 로 생성
      return NativeDatabase(file); // 이 파일로 데이터베이스를 만들면 됨 -> 데이터베이스 생성 끝!
    });
  }
}
