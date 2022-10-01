
import 'package:firebase_messaging/firebase_messaging.dart';

//const TOKEN = 'manshy.php';

const NOTIFICATIONS = "apinew.php/";

String TOKEN = FirebaseMessaging.instance.getToken().toString();