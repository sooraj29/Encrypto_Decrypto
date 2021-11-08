// ignore_for_file: avoid_print

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:encrypto_decrypto/firebase_file.dart';

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<String>> _getDownloadLinks(List<Reference> refs) => Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    final urls = await _getDownloadLinks(result.items);

    return urls
        .asMap()
        .map((index, url) {
      final ref = result.items[index];
      final name = ref.name;
      final file = FirebaseFile(ref: ref, name: name, url: url);

      return MapEntry(index, file);
    })
        .values
        .toList();
  }

  static Future downloadFile(Reference ref) async {
    final dir = await getExternalStorageDirectory();
    final file = File('${dir!.path}/${ref.name}');
    print(dir.path);
    await ref.writeToFile(file);
  }
}