import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'System/systemConfig.dart';
import 'firebase_options.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _passworld;

  @override
  void initState() {
    _email = TextEditingController();
    _passworld = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _passworld.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Thiết lập cấu hình dựa trên kích thước màn hình
    AppSettings.setup(context);
    final double SCREEN_HEIGTH = MediaQuery.of(context).size.height;
    final double SCREEN_WIDTH = MediaQuery.of(context).size.width;

    var test = AppSettings.logoScreenHeigthPhone;
    print('Test:$test');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: double.infinity,
          constraints: BoxConstraints(
            maxWidth: SCREEN_WIDTH, // Tùy chỉnh chiều rộng tối đa của logo
            maxHeight: SCREEN_HEIGTH, // Tùy chỉnh chiều cao tối đa của logo
          ),
          padding: const EdgeInsets.fromLTRB(12, 15, 12, 5),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  './lib/assets/image/background-moblie-rongchoi.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth:
                          SCREEN_WIDTH, // Tùy chỉnh chiều rộng tối đa của logo
                      maxHeight: AppSettings
                          .logoScreenHeigthPhone, // Tùy chỉnh chiều cao tối đa của logo
                    ),
                    child: SvgPicture.asset(
                      './lib/assets/logo/logo-rongchoi-testbug3.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                TextField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 236, 238, 237),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 19.0, horizontal: 13.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(11)),
                      hintText: 'Tài khoảng'),
                  style: TextStyle(
                    fontSize: AppSettings.titleFontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passworld,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 236, 238, 237),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 19.0, horizontal: 13.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(11)),
                    hintText: 'Mật khẩu',
                  ),
                  style: TextStyle(fontSize: AppSettings.titleFontSize),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Quên mật khẩu?',
                          style:
                              TextStyle(fontSize: AppSettings.titleFontSize)),
                    ),
                  ],
                ),
                SizedBox(
                  width: SCREEN_WIDTH,
                  height: 70.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: SCREEN_WIDTH - 40,
                        height: 47.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 250, 164, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () async {
                            final email = _email.text;
                            final password = _passworld.text;

                            final UserCredential userCredential =
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );

                            print(userCredential);
                          },
                          child: Text(
                            'Đăng nhập',
                            style:
                                TextStyle(fontSize: AppSettings.titleFontSize),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    child: Column(
                  children: [
                    const Text('Hoặc'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SignInButton(Buttons.Google, onPressed: () {}),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SignInButton(Buttons.Facebook, onPressed: () {}),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
