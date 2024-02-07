import 'package:devotionalapp/size.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, required this.onUpdateCallback});
  final ValueChanged<Sizes> onUpdateCallback;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final List<String> options = ["Small", "Medium", "Large"];
  int ind = 0;
  int? selected;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 83, 48, 144),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Little Light Kids",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 255, 90, 0),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  "PO Box 70",
                  style: TextStyle(
                    color: Color.fromARGB(255, 83, 48, 144),
                  ),
                ),
                Text(
                  "Ooltewah, TN 37363",
                  style: TextStyle(
                    color: Color.fromARGB(255, 83, 48, 144),
                  ),
                ),
                SizedBox(height: 15),
                // Text(
                //   "Email: ",
                //   style: TextStyle(
                //     color: Color.fromARGB(255, 83, 48, 144),
                //   ),
                // ),
                Text(
                  "Website: littlelightkids.com",
                  style: TextStyle(
                    color: Color.fromARGB(255, 83, 48, 144),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 100,
                width: size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.6],
                    colors: [
                      Color.fromARGB(255, 252, 218, 70),
                      Color.fromARGB(255, 251, 193, 59),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Font Size",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 83, 48, 144),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 30,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 244, 135, 35),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (c, i) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                ind = i;
                                // selected = i;
                                if (ind == 0) {
                                  print("SMALL FONT SIZE");
                                  Sizes value =
                                      const Sizes(bodySize: 12, titleSize: 20);
                                  widget.onUpdateCallback(value);
                                  if (mounted) setState(() {});
                                  Navigator.of(context).pop();
                                  // setState(() {
                                  //   fontSize = 12;
                                  //   titleSize = 20;
                                  // });
                                } else if (ind == 1) {
                                  print("MEDIUM FONT SIZE");
                                  Sizes value =
                                      const Sizes(bodySize: 15, titleSize: 23);
                                  widget.onUpdateCallback(value);
                                  if (mounted) setState(() {});
                                  Navigator.of(context).pop();
                                  // setState(() {
                                  //   fontSize = 15;
                                  //   titleSize = 23;
                                  // });
                                } else {
                                  print("LARGE FONT SIZE");
                                  Sizes value =
                                      const Sizes(bodySize: 18, titleSize: 25);
                                  widget.onUpdateCallback(value);
                                  if (mounted) setState(() {});
                                  Navigator.of(context).pop();
                                  // setState(() {
                                  //   fontSize = 18;
                                  //   titleSize = 25;
                                  // });
                                }
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ind == i
                                    ? Colors.white
                                    : const Color.fromARGB(255, 244, 135, 35),
                              ),
                              child: Center(
                                child: Text(
                                  options[i],
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: ind == i
                                        ? Colors.black
                                        : const Color.fromARGB(
                                            255, 255, 253, 248),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: options.length,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
