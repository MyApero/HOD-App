import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:hod_app/constants/appwrite_constants.dart';

Client client = Client()
    .setEndpoint(AppwriteConstants.endpoint)
    .setProject(AppwriteConstants.projectId)
    .setSelfSigned(status: true);

Databases get database => Databases(client);
Realtime get realtime => Realtime(client);

