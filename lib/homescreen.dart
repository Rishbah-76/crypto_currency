import 'package:crypto_currency/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = " ", email = " ";
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  void getUserDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      name = pref.getString('name') ?? "";
      email = pref.getString('email') ?? "";
    });
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black26 : Colors.white,
      appBar: AppBar(
        title: const Text("CryptoCurrency"),
      ),
      drawer: Drawer(
        backgroundColor: isDarkMode ? Colors.black26 : Colors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              accountEmail: Text(
                email,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              currentAccountPicture: const Icon(
                Icons.account_circle,
                size: 70,
                color: Colors.white10,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateProfileScreen()));
              },
              leading: isDarkMode
                  ? Icon(
                      Icons.account_box,
                      color: isDarkMode
                          ? Color.fromARGB(225, 222, 212, 22)
                          : Colors.black,
                    )
                  : const Icon(
                      Icons.account_box,
                    ),
              title: Text(
                "Update Profile",
                style: TextStyle(
                  color: isDarkMode
                      ? const Color.fromARGB(225, 222, 212, 22)
                      : Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                setState(() {
                  isDarkMode = !isDarkMode;
                });
                await prefs.setBool("isDarkMode", isDarkMode);
              },
              leading: isDarkMode
                  ? Icon(
                      Icons.dark_mode,
                      color: isDarkMode
                          ? const Color.fromARGB(225, 222, 212, 22)
                          : Colors.black,
                    )
                  : const Icon(
                      Icons.light_mode,
                    ),
              title: Text(
                isDarkMode ? "Dark Mode" : "Light Mode",
                style: TextStyle(
                  color: isDarkMode
                      ? const Color.fromARGB(225, 222, 212, 22)
                      : Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
