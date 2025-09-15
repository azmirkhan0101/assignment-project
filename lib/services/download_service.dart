import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DownloadService {
  final Dio dio = Dio();

  Future<String> downloadPdf({
    required String url,
    required String fileName,
    required void Function(double) onProgress,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final filePath = "${dir.path}/$fileName";

    await dio.download(
      url,
      filePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          onProgress(received / total);
        }
      },
    );

    return filePath;
  }
}
