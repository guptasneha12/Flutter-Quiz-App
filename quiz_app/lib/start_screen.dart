import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';  

class StartScreen extends StatelessWidget {
  // here function refers to the switchScreen function which is passed a and agrument in StartScreen
  const StartScreen(this.startQuiz,
      {super.key}); // this is the constructor function it means StartScreen accepting the key and forward it to super class which is StatelessWidget in that case
  final void Function() startQuiz; // now this function can be used anywhere
  // overriding the method expected by widget
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255,
                255), // it changes the color of image or overlay color on top of image
          ),

          // to add the image on screen if
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
              height:
                  50), // to define the exact size of widget so that it does not take the whole available space
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight:FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            // to add icon on the button
            onPressed: startQuiz,  
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white, // setting the text color
            ),
            icon: const Icon(Icons.arrow_right_alt),

            label: const Text('Start Quiz', style: TextStyle(fontSize: 20)),
          )
        ],
      ), // to display contents, image,buttons ABOVE each other
    );
  }
}
