import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 249, 249),
        width: width,
        height: height,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(144),
                child: Container(
                  height: width * .6,
                  width: width * .6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(
                        'images/aki.jpeg',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              //Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 147, 187, 207),
                    border:
                        Border.all(color: Color.fromARGB(255, 97, 150, 177)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Nahom Temesgen Retebo",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 147, 187, 207),
                    border:
                        Border.all(color: Color.fromARGB(255, 97, 150, 177)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "nahomtemesgen@gmail.com",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //Phone number
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 147, 187, 207),
                    border:
                        Border.all(color: Color.fromARGB(255, 97, 150, 177)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "+251909791160",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
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
}
