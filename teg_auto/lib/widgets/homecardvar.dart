import 'package:flutter/material.dart';

class HomeCardVar extends StatelessWidget {
  const HomeCardVar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.grey),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black87,
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            height: size.height * 0.50,
            width: size.width * 0.85,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: SizedBox(
                    height: size.height * 0.25,
                    width: size.width,
                    child: Image.asset(
                      'assets/images/bmw-m8-coupe-onepager-sp-desktop.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.20,
                  right: size.width * 0.05,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100)),
                    height: size.height * 0.08,
                    width: size.height * 0.08,
                    child: Image.asset(
                      'assets/images/tire (1).png',
                      cacheHeight: 45,
                      cacheWidth: 45,
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.18,
                  left: size.width * 0.03,
                  child: Text("Bmw",
                      style: TextStyle(
                          fontSize: size.height * 0.040,
                          fontWeight: FontWeight.bold)),
                ),
                Positioned(
                  bottom: size.height * 0.13,
                  left: size.width * 0.02,
                  child: Text(
                    "M8 Competition",
                    style: TextStyle(fontSize: size.height * 0.035),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.13,
                  right: size.width * 0.02,
                  child: Text(
                    "100000 €",
                    style: TextStyle(fontSize: size.height * 0.035),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.045,
                  left: size.width * 0.05,
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.22,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Text(
                      "10 km",
                      style: TextStyle(fontSize: size.height * 0.030),
                    )),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.045,
                  left: size.width * 0.315,
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.22,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Text(
                      "10 km",
                      style: TextStyle(fontSize: size.height * 0.030),
                    )),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.045,
                  right: size.width * 0.05,
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.22,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Text(
                      "10 km",
                      style: TextStyle(fontSize: size.height * 0.030),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
