import 'api/api_client.dart';
import 'api_services.dart';

class Global {
  static late ApiClient apiClient;

  static Future init() async {
    // WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    apiClient = ApiServices().init();
  }
}
