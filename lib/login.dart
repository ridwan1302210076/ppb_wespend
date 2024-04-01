import 'package:flutter/material.dart';
import 'package:pbb_wespend/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = true;
  bool isPasswordVisible = false;

  void validateEmail(String email) {
    setState(() {
      if (email.isEmpty) {
        isEmailValid = true;
      } else {
        isEmailValid = email.endsWith("@gmail.com");
      }
    });
  }

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void submitForm() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[600],
      body: SafeArea(
        child: SingleChildScrollView(
          // Tambahkan widget ini
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "WSpend",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black87,
                    fontFamily: "VampiroOne",
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ayo mulai bijak dengan keuanganmu di aplikasi WSpend!",
                          style: TextStyle(fontSize: 20, fontFamily: "Roboto"),
                        ),
                        // Tambahkan widget atau teks di sini
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'Masukkan Email',
                            ),
                            onChanged: (value) {
                              validateEmail(value);
                            },
                          ),
                          if (!isEmailValid)
                            const Text(
                              "Email harus berakhir dengan @gmail.com",
                              style: TextStyle(color: Colors.red),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Password",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Masukkan Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: togglePasswordVisibility,
                              ),
                            ),
                            obscureText: !isPasswordVisible,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: submitForm,
                  child: const Text(
                    "Masuk",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Warna teks
                    minimumSize:
                        const Size(double.infinity, 50), // Tombol selebar layar
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Sudut melengkung
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  "Atau",
                  style: TextStyle(fontSize: 22),
                ),
                ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Warna teks
                    minimumSize:
                        const Size(double.infinity, 50), // Tombol selebar layar
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Sudut melengkung
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 8),
                      Text(
                        'Google',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
