import 'package:back_end_with_conduit/back_end_with_conduit.dart';

Future main() async {
  final app = Application<BackEndWithConduitChannel>()
    ..options.configurationFilePath = "config.yaml"
    ..options.port = 8888;

  await app.startOnCurrentIsolate();

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}
