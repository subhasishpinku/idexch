import 'package:flutter/material.dart';
import 'package:idexch/core/providers/login_provider.dart';
import 'package:idexch/core/utils/SnackbarUtil.dart';
import 'package:idexch/views/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:idexch/widgets/CustomButton.dart';
import 'package:idexch/widgets/InputField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isBackupEnabled = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _captchaController = TextEditingController();
  String captchaValue = "144"; // You can make this dynamic later
  String expireTime = "10";
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF6A1B9A),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "BACKUP",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                  Switch(
                    value: isBackupEnabled,
                    onChanged: (value) {
                      setState(() => isBackupEnabled = value);
                    },
                    activeColor: Colors.white,
                    activeTrackColor: Colors.deepPurple[300],
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.deepPurple[200],
                  ),
                ],
              ),
            ),
            Image.asset('assets/dx_logo.png', width: 150),
            const Text(
              "IDEXCH",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputField(
                    label: "Username",
                    controller: _usernameController,
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    label: "Password",
                    isPassword: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.refresh, color: Colors.white),
                        onPressed: () {
                          // TODO: Add captcha refresh logic
                          setState(() {
                            captchaValue = "999"; // Example new value
                          });
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          captchaValue,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text("=", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: InputField(
                          label: "Enter Captcha",
                          controller: _captchaController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Please verify you are a human.",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  if (loginProvider.errorMessage != null)
                    Text(
                      loginProvider.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 20),
                  loginProvider.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : CustomButton(
                          text: "LOGIN",
                          onPressed: () async {
                            final success = await loginProvider.login(
                              _usernameController.text.trim(),
                              _passwordController.text.trim(),
                              _captchaController.text.trim(),
                              expireTime,
                            );

                            if (success) {
                             SnackbarUtil.show(context, "Login successful", backgroundColor: Colors.black);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DashboardScreen(),
                                ),
                              );
                              // TODO: Navigate to home screen
                            } else {
                             
                              SnackbarUtil.show(context, "Login failed", backgroundColor: Colors.black);

                            }
                          },
                        ),
                  const SizedBox(height: 20),
                  TextButton.icon(
                    onPressed: () {
                      // TODO: Handle fingerprint login
                    },
                    icon: const Icon(Icons.fingerprint, color: Colors.white),
                    label: const Text(
                      "Login with fingerprint",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
