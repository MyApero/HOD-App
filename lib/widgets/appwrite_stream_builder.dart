import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/constants/appwrite_constants.dart';
import 'package:hod_app/core/appwrite.dart';
import 'package:hod_app/core/utils.dart';

class AppwriteStreamBuilder extends ConsumerStatefulWidget {
  const AppwriteStreamBuilder({
    super.key,
    this.itemBuilder,
    required this.builder,
    this.collectionId = DbConst.events,
    this.databaseId = AppwriteConstants.databaseId,
  });

  final dynamic Function(Map<String, dynamic> jsonItem)? itemBuilder;
  final Widget Function(List<dynamic>) builder;
  final String collectionId;
  final String databaseId;

  @override
  ConsumerState<AppwriteStreamBuilder> createState() =>
      _AppwriteStreamBuilderState();
}

class _AppwriteStreamBuilderState extends ConsumerState<AppwriteStreamBuilder> {
  List<dynamic> items = [];
  late RealtimeSubscription subscription;

  void loadItems() async {
    try {
      database
          .listDocuments(
              databaseId: widget.databaseId, collectionId: widget.collectionId)
          .then((data) {
        setState(() {
          items = data.documents.map((e) {
            if (widget.itemBuilder != null) {
              return widget.itemBuilder!(e.data);
            }
            return e.data;
          }).toList();
        });
      });
    } on AppwriteException catch (e) {
      showSnackBar(context, e.message ?? 'Unexpected error');
    }
  }

  void subscribe() {
    print('subscribing  ');

    subscription = realtime.subscribe([
      'databases.${AppwriteConstants.databaseId}.collections.${DbConst.events}.documents'
      // 'databases.${widget.databaseId}.collections.${widget.collectionId}.documents'
    ]);
    subscription.stream.listen((event) {
      print(event);
      loadItems();
    });

    /*
    subscription.stream.listen((data) {
      log("there is some change");
      // data will consist of `events` and a `payload`
      if (data.payload.isNotEmpty) {
        log("there is some change");
        if (data.events
            .contains("databases.*.collections.*.documents.*.create")) {
          var item = data.payload;
          log("Item Added");
          items.add(item);
          setState(() {});
        } else if (data.events
            .contains("databases.*.collections.*.documents.*.delete")) {
          var item = data.payload;
          log("item deleted");
          items.removeWhere((it) => it['\$id'] == item['\$id']);
          setState(() {});
        } else if (data.events
            .contains("databases.*.collections.*.documents.*.update")) {
          var item = data.payload;
          log("item update");
          int idx = items.indexWhere((it) => it['\$id'] == item['\$id']);
          log("${idx} is the index");
          items[idx] = item;
          setState(() {});
        }
      }
    });
    */
  }

  @override
  void initState() {
    super.initState();
    loadItems();
    subscribe();
  }

  @override
  void dispose() {
    // subscription.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(items);
  }
}
