import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController _emailTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();
  bool rememberUser = false;
  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // build top
            Positioned(
              top: 40,
              child: _buildTop(),
            ),
            // build bottom
            Positioned(
              bottom: 0,
              child: _buildBottom(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on_sharp,
            color: Colors.white,
            size: 70,
          ),
          Text(
            'GO MAP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome',
          style: TextStyle(
            color: myColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Please login with your information',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 60),
        const Text(
          'Email Address',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        _buildInputField(_emailTEController),
        const SizedBox(height: 40),
        const Text(
          'Password',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        _buildInputField(_passwordTEController, isPassword: true),
        const SizedBox(height: 20),
        _buildRememberForgot(),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        _buildOtherLogin(),
      ],
    );
  }

  Widget _buildInputField(TextEditingController controller, {isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: isPassword? const Icon(Icons.remove_red_eye) : const Icon(Icons.done),
      ),
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
            value: rememberUser,
            onChanged: (value) {
              rememberUser = value!;
              setState(() {});
            },
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'I forgot my password',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
        onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: myColor,
        shape: const StadiumBorder(),
        minimumSize: const Size.fromHeight(60),
        elevation: 20,
      ),
        child: const Text(
            'LOGIN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
    );
  }

  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          const Text(
            'Or Login with',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(icon: Image.asset('assets/icons/facebook.png')),
              Tab(icon: Image.asset('assets/icons/twitter.png')),
              Tab(icon: Image.asset('assets/icons/github.png')),
            ],
          ),
        ],
      ),
    );
  }
}
