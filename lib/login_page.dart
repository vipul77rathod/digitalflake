import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key,}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Login"),
      ),

      body: Container(
        margin: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  hintText: "Enter username",
                ),
                validator: (val){
                  if(val!.trim().isEmpty) {
                    return "Please enter username";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _userPasswordController,
                obscureText: _isPasswordVisible,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: (){
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    child: _isPasswordVisible ?
                    const Icon(Icons.visibility_off) :
                    const Icon(Icons.visibility),
                  ),
                  hintText: "Enter password",
                ),
                validator: (str){
                  if(str!.trim().isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                },
              ),

              InkWell(
                onTap: validateUser,
                child: Container(
                  height: 55,
                  width: 200,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: const Text(
                      "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),

    );
  }

  void validateUser() {

    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage())
      );
    }

  }

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _userPasswordController.dispose();

  }


}
