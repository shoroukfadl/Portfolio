import 'package:idb_shim/idb_browser.dart';
import 'package:uuid/uuid.dart';

class GuestSessionHandler {
  static const String dbName = 'GuestDatabase';
  static const String storeName = 'GuestStore';
  static const String key = 'guest_id';

  static Future<String> getGuestId() async {
    const uuid = Uuid();

    // Open IndexedDB database
    final idbFactory = idbFactoryBrowser;
    final db =
        await idbFactory.open(dbName, version: 1, onUpgradeNeeded: (event) {
      final db = event.database;
      db.createObjectStore(storeName);
    });

    final txn = db.transaction(storeName, 'readwrite');
    final store = txn.objectStore(storeName);

    // Check if guest ID exists
    var guestId = await store.getObject(key) as String?;

    if (guestId == null) {
      // Generate new UUID and store it
      guestId = uuid.v4();
      await store.put(guestId, key);
    }

    await txn.completed;
    return guestId;
  }
}
