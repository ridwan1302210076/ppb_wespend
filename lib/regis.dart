import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pbb_wespend/home.dart';

class Regis extends StatefulWidget {
  const Regis({Key? key}) : super(key: key);

  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isEmailValid = true;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isPasswordMatch = true;

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

  void toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }

  void validatePasswordMatch(String value) {
    setState(() {
      isPasswordMatch = value == passwordController.text;
    });
  }

  void submitForm() {
    if (isPasswordMatch) {
      // Password match, proceed to registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    } else {
      // Password does not match, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password tidak sama.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[600],
      body: SafeArea(
        child: SingleChildScrollView(
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
                            "Nama",
                            style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20)),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: 'Masukkan Nama',
                            ),
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
                            "No HP",
                            style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20)),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: 'Masukkan No HP',
                            ),
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
                              style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.red)),
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
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Konfirmasi Password",
                            style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20)),
                          ),
                          TextField(
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              hintText: 'Konfirmasi Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isConfirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: toggleConfirmPasswordVisibility,
                              ),
                            ),
                            obscureText: !isConfirmPasswordVisible,
                            onChanged: validatePasswordMatch,
                          ),
                          if (!isPasswordMatch)
                            const Text(
                              "Password tidak sama",
                              style: TextStyle(color: Colors.red),
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
                    "Buat Akun",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
