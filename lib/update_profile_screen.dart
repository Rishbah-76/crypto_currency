import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();

  //to Store the data in local storage
  Future<void> saveDataToLocal(String key, String value) async {
    //Initializing thr shared_preferences instance
    SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.setString(key, value);
  }

  //To retrive the data from TextField annd store in local storage
  void saveUserDetails() async {
    await saveDataToLocal('name', name.text);
    await saveDataToLocal('email', email.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Update"),
      ),
      body: Column(
        children: [
          customTextfield("Name", name),
          customTextfield("Email", email),
          ElevatedButton(onPressed: () {}, child: const Text("Update Details"))
        ],
      ),
    );
  }

  Widget customTextfield(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: title,
        ),
      ),
    );
  }
}
