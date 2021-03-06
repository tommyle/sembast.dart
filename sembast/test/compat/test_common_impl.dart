// basically same as the io runner but with extra output
import 'package:sembast/src/database_impl.dart';

export 'package:dev_test/test.dart';

DatabaseExportStat getDatabaseExportStat(SembastDatabase db) {
  return DatabaseExportStat.fromJson(db.toJson()["exportStat"] as Map);
}
