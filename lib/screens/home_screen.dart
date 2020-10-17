import 'package:flutter/material.dart';
import 'package:theme_mode_handler/theme_picker_dialog.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("A am here"),
            FlatButton(onPressed: (){ _selectThemeMode(context); }, child: Text("Button"))
          ],
        ),
      ),
    );
  }

  void _selectThemeMode(BuildContext context) async {
    final newThemeMode = await showThemePickerDialog(context: context);
    print(newThemeMode);
  }
}
