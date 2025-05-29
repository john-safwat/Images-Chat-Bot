import 'package:chat_bot/core/di/modules/logger_module.dart';
import 'package:chat_bot/data/models/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class HistoryDatasource {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  CollectionReference<Chat> getCollection() {
    return firebaseFirestore.collection('chats').withConverter<Chat>(
          fromFirestore: (snapshot, _) => Chat.fromJson(snapshot.data()!),
          toFirestore: (chat, _) => chat.toJson(),
        );
  }

  Future<void> uploadChat(Chat chat) async {
    try {
      if (chat.id == null) {
        var collection = getCollection();
        var doc = collection.doc();
        chat.id = doc.id;
        await doc.set(chat);
      } else {
        await getCollection().doc(chat.id).update(chat.toJson());
      }
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
