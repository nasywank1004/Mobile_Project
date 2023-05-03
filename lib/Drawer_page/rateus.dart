import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateApp extends StatelessWidget {
  const RateApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rating App',
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: const RateUs(),

    );
  }
}

class RateUs extends StatelessWidget {
  const RateUs({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ReserveEats", style: TextStyle(
                          color: Colors.white)),
        backgroundColor: Colors.amber,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          const SizedBox(height: 30),
          const Text('Rating Bar Change'),
          RatingBar.builder(
            itemCount: 5,
            itemSize: 50,
            initialRating: 0,
            minRating: 0,
            allowHalfRating: true,
            direction: Axis.horizontal,
            itemPadding: const EdgeInsets.symmetric(horizontal: 5),
            itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amberAccent,), 
            onRatingUpdate: (value) {
              print(value);
            }),

            const SizedBox(height: 30),
            const Text('Do you like us?'),
            RatingBar.builder(
              initialRating: 3,
              itemCount: 5,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return const Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                  return const Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                  );
                  case 2:
                    return const Icon(
                        Icons.sentiment_neutral,
                        color: Colors.amber,
                    );
                  case 3:
                    return const Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.lightGreen,
                    );
                  case 4:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                    default:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,);
                }
              },
              onRatingUpdate: (rating) {
                print(rating);
              },
            )
          ],
        ),
      ),

    );
  }
}