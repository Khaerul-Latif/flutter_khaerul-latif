import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins(Registrar registrar) {
  FilePickerWeb.registerWith(registrar);
  registrar.registerMessageHandler();
}
