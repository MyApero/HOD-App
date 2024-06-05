

// import 'package:appwrite/appwrite.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hod_app/constants/db_const.dart';

// final appwriteClientProvider = Provider((ref) {
//   Client client = Client();
//   return client
//       .setEndpoint(AppwriteConstants.endpoint)
//       .setProject(AppwriteConstants.projectId)
//       .setSelfSigned(status: true);
// });

// final appwriteAccountProvider = Provider((ref) {
//   final client = ref.watch(appwriteClientProvider);
//   return Account(client);
// });

// final databaseProvider = Provider((ref) {
//   final client = ref.watch(appwriteClientProvider);
//   return Databases(client);
// });

// final realtimeProvider = Provider((ref) {
//   final client = ref.watch(appwriteClientProvider);
//   return Realtime(client);
// });
