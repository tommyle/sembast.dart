import 'package:sembast/src/api/compat/record.dart';
import 'package:sembast/src/api/compat/store.dart';
import 'package:sembast/src/api/filter.dart';
import 'package:sembast/src/api/finder.dart';
import 'package:sembast/src/api/sembast.dart';

export 'package:sembast/src/api/compat/database_mode.dart';
export 'package:sembast/src/api/compat/finder.dart';
export 'package:sembast/src/api/compat/record.dart';
export 'package:sembast/src/api/compat/store.dart';

/// @deprecated v2
abstract class TransactionExecutor extends DatabaseExecutor {
  /// The main store used
  StoreExecutor get mainStore;

  /// All the stores in the database
  Iterable<StoreExecutor> get stores;

  ///
  /// get or create a store
  /// an empty store will not be persistent
  ///
  StoreExecutor getStore(String storeName);

  ///
  /// clear and delete a store
  ///
  Future deleteStore(String storeName);

  ///
  /// find existing store
  ///
  StoreExecutor findStore(String storeName);
}

/// @deprecated v2
abstract class DatabaseExecutor extends StoreExecutor {
  ///
  /// Put a record
  ///
  Future<Record> putRecord(Record record);

  ///
  /// Put a list or records
  ///
  Future<List<Record>> putRecords(List<Record> records);

  ///
  /// delete a [record]
  ///
  Future deleteRecord(Record record);
}

/// @deprecated v2
abstract class StoreExecutor extends BaseExecutor {
  ///
  /// delete all records in a store
  ///
  Future clear();

  ///
  /// get a record by key
  ///
  Future<Record> getRecord(dynamic key);

  ///
  /// Get all records from a list of keys
  ///
  Future<List<Record>> getRecords(Iterable keys);

  ///
  /// return the list of deleted keys
  ///
  Future deleteAll(Iterable keys);

  ///
  /// stream all the records
  ///
  Stream<Record> get records;
}

///
/// Method shared by Store and Database (main store)
///
/// @deprecated v2
abstract class BaseExecutor {
  Store get store;

  ///
  /// get a value from a key
  /// null if not found or if value null
  ///
  Future get(dynamic key);

  ///
  /// count all records
  ///
  Future<int> count([Filter filter]);

  ///
  /// put a value with an optional key. Returns the key
  ///
  Future put(dynamic value, [dynamic key]);

  ///
  /// Update an existing record if any with the given key
  /// if value is a map, existing fields are replaced but not removed unless
  /// specified ([FieldValue.delete])
  ///
  /// Does not do anything if the record does not exist
  ///
  /// Returns the record value (merged) or null if the record was not found
  ///
  Future update(dynamic value, dynamic key);

  ///
  /// delete a record by key
  ///
  Future delete(dynamic key);

  ///
  /// find the first matching record
  ///
  Future<Record> findRecord(Finder finder);

  ///
  /// find all records
  ///
  Future<List<Record>> findRecords(Finder finder);

  /// new in 1.7.1
  Future<bool> containsKey(dynamic key);

  /// new in 1.9.0
  Future<List> findKeys(Finder finder);

  /// new in 1.9.0
  Future findKey(Finder finder);
}

//import 'package:tekartik_core/dev_utils.dart';
/// @deprecated v2
abstract class StoreTransaction extends StoreExecutor {}
