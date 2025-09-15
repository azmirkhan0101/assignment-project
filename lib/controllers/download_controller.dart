import 'package:assignment_app/services/download_service.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DownloadController extends GetxController {
  var progress = 0.0.obs;
  final DownloadService downloadService = DownloadService();
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    initializeNotifications();
  }

  void initializeNotifications() {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const settings = InitializationSettings(android: androidSettings, iOS: iosSettings);

    notificationsPlugin.initialize(settings, onDidReceiveNotificationResponse: (payload) {
      if (payload != null) {
        //NO NEED TO OPEN THE FILE NOW
      }
    });
  }

  Future<void> downloadPdf(String url, String fileName) async {
    progress.value = 0.0;

    final filePath = await downloadService.downloadPdf(
      url: url,
      fileName: fileName,
      onProgress: (p) => progress.value = p,
    );

    showNotification(filePath);
  }

  void showNotification(String filePath) async {
    final androidDetails = AndroidNotificationDetails(
      'pdf_channel',
      'PDF Downloads',
      channelDescription: 'Notification after PDF download',
      importance: Importance.max,
      priority: Priority.high,
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction(
          'open_pdf',
          'Open PDF',
          showsUserInterface: true,
        ),
      ],
    );

    final iosDetails = DarwinNotificationDetails();
    final notificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);

    await notificationsPlugin.show(
      0,
      'Download Complete',
      'Your PDF has been downloaded!',
      notificationDetails,
      payload: filePath,
    );
  }
}
