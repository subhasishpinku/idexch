import 'package:flutter/material.dart';
import 'package:idexch/core/providers/logout_provider.dart';
import 'package:idexch/core/utils/DBHelper.dart';
import 'package:idexch/core/utils/SnackbarUtil.dart';
import 'package:idexch/views/loginscreen.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String userName = "";
  String? token = "";
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final data = await DBHelper.getUser();
    setState(() {
      userName = data?['username'] ?? '';
      token = data?['token'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final logoutProvider = Provider.of<LogoutProvider>(
                context,
                listen: false,
              );

              bool isLoggedOut = await logoutProvider.logout(token);

              SnackbarUtil.show(
                context,
                logoutProvider.message ?? "Logout complete",
                backgroundColor: Colors.black,
              );

              if (isLoggedOut) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          userName.isNotEmpty ? userName : 'Loading...',
          style: const TextStyle(color: Colors.black, fontSize: 30.0),
        ),
      ),
    );
  }
}
