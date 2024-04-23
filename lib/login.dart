
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pbb_wespend/regis.dart';

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

  void goToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Regis(), // Navigasi ke halaman Regis
      ),
    );
  }

  void submitForm() {
    // Implementasi logika autentikasi atau navigasi sesuai kebutuhan aplikasi Anda
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ayo mulai bijak dengan keuanganmu di aplikasi WSpend!",
                          style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20)),
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
                          Text(
                            "Email",
                            style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20)),
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
                            Text(
                              "Email harus berakhir dengan @gmail.com",
                              style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20, color:Colors.red)),
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
                          Text(
                            "Password",
                            style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20)),
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
                  child: Text(
                    "Masuk",
                    style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20)),
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
                Text(
                  "Atau",
                  style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 22)),
                ),
                ElevatedButton(
                  onPressed: goToRegisterPage, // Navigasi ke halaman Regis
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Warna teks
                    minimumSize:
                        const Size(double.infinity, 50), // Tombol selebar layar
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Sudut melengku
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 8),
                      Text(
                        'Register',
                        style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20)),
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
