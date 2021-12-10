
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template1/blocs/login_bloc.dart';
import 'package:template1/template1_app/app_theme.dart';
import 'package:template1/template1_app/login_page_screen.dart';

class SignUpcreen extends StatefulWidget {
  const SignUpcreen({Key? key}) : super(key: key);

  @override
  _SignUpcreenState createState() => _SignUpcreenState();
}

class _SignUpcreenState extends State<SignUpcreen> {

  LoginBloc bloc = LoginBloc();
  bool _value = false;
  bool _showPass = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child:  SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "Sign Up", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold , fontSize: 36, shadows: [
                        Shadow(
                          blurRadius: 1.0,
                          color: Colors.black26,
                          offset: Offset(-0.5, 5.0),
                        ),
                      ]),
                      ),
                      TextButton(
                        child: const Text("Login"),
                        onPressed: (){
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: gotoLogin), (route) => false);
                        },
                        style:TextButton.styleFrom(
                          primary: AppTheme.greenPrimary,
                          textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        color: AppTheme.grey1,
                      ),
                      child: TextField(
                        cursorColor: Colors.black,
                        style: const TextStyle(
                            fontSize: 18, color: Colors.black),
                        controller: _nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: "Name",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            labelStyle: TextStyle(
                                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),

              Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: StreamBuilder(
                    stream: bloc.emailStream,
                    builder: (context, snapshot) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        color: AppTheme.grey1,
                      ),
                      child: TextField(
                        cursorColor: Colors.black,
                        style: const TextStyle(
                            fontSize: 18, color: Colors.black),
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: const  OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: "Email",
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelStyle: const TextStyle(
                                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    StreamBuilder(
                      stream: bloc.passStream,
                      builder: (context, snapshot) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                          color: AppTheme.grey1,
                        ),
                        child: TextField(
                          cursorColor: Colors.black,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          controller: _passController,
                          obscureText: !_showPass,
                          //cho nay true thi giau pass, con failse thi ...
                          //cho nay true thi giau pass
                          decoration: InputDecoration(
                              border: const  OutlineInputBorder(borderSide: BorderSide.none),
                              hintText: "Password",
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: const TextStyle(
                                  color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onToggleShowPass,
                      child: Text(
                        _showPass ? "Hide    " : "Show    ",
                        style: const TextStyle(
                          color: AppTheme.greenPrimary,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                      child: Checkbox(
                        checkColor: Colors.white,
                        fillColor:
                        MaterialStateProperty.all<Color>(
                            AppTheme.greenPrimary),
                        value: _value,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onChanged: (bool? value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'I would like to receive your newsletter and other promotional information.',
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      child: const Text('Sign Up',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
                      onPressed: login,
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45.0),
                                  side: const BorderSide(color: Colors.black)
                              )
                          ),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(
                              AppTheme.greenPrimary),
                          overlayColor: MaterialStateProperty.all<Color>(
                              Colors.white70),
                          foregroundColor:
                          MaterialStateProperty.all<Color>(
                              Colors.white70),
                          elevation:
                          MaterialStateProperty.resolveWith<double>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed) ||
                                  states.contains(MaterialState.disabled)) {
                                return 0;
                              }
                              return 10;
                            },
                          ))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass; //lay phu dinh
    });
  }
  Widget gotoLogin(BuildContext context) {
    return const LoginPage();
  }
  login() {
    if (_passController.text.isNotEmpty && _emailController.text.isNotEmpty) {
      if (bloc.isValidUsername(_emailController.text) &&
          bloc.isValidPassword(_passController.text)) {
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Email/password is wrong")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email and password cannot be blank")));
    }
  }
}
