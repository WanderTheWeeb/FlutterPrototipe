import 'package:file_picker/file_picker.dart';

Future<String?> _pickFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // Obtiene la ruta del archivo seleccionado
      String filePath = result.files.single.path!;
      return filePath;
    } else {
      // El usuario canceló la selección
      return null;
    }
  } catch (e) {
    print('Error al seleccionar el archivo: $e');
    return null;
  }
}