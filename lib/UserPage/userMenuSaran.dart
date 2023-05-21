import 'package:flutter/material.dart';

class MenuSaran extends StatelessWidget {
  const MenuSaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('This Application is to fullfill the Final Project from TPM course,'
              'For the Impression and Suggestion to this Course'),
          SizedBox(height: 20),
          Text(
            'Impression : ',
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 15),
          Text(
            '- This course have so much surprise element in the '
                'assignment and task',
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          Text(
            '- I always waiting the presentation section but '
                'not ready for the quiz or assignment announcment:)',
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            'Suggestion :',
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          Text(
            '- I Think no Sir:)',
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
