import 'package:book_app/models/model.dart';
import 'package:book_app/pages/intro_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'register.dart';

class LoginPage extends StatefulWidget{
  final VoidCallback toggleDarkMode;
  final bool isDarkMode;

  LoginPage({required this.toggleDarkMode, required this.isDarkMode});

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBooksCarousel(),
              SizedBox(height: 20),
              _buildTextField(userNameController, 'User Name'),
              SizedBox(height: 10),
              _buildTextField(passwordController, 'Password', obscureText: true),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IntroScreen(toggleDarkMode: widget.toggleDarkMode, isDarkMode: widget.isDarkMode),
                    ),
                  );
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(
                        toggleDarkMode: widget.toggleDarkMode,
                        isDarkMode: widget.isDarkMode,
                      ),
                    ),
                  );
                },
                child: Text("Don't have an account? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, {bool obscureText = false}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      obscureText: obscureText,
    );
  }

  Widget _buildBooksCarousel(){
    return CarouselSlider.builder(
      itemCount: books.length,
      itemBuilder: (context, index, child){
        final book = books[index];
        return _buildbookItem(book);
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2,
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }

  Widget _buildbookItem(Book book){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(book.imageURL),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}