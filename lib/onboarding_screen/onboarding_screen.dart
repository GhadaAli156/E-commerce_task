import 'package:flutter/material.dart';
import '../Home_screen/home screen.dart';
import '../database/DatabaseHelper.dart';

class OnboardingScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFA451),
      body: PageView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Expanded(
                  child: Image.asset('assets/images/frut1.JPG',
                      fit: BoxFit.fitHeight)),
              Expanded(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 17, right: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Get The Freshest Fruit Salad Combo',
                            style: TextStyle(
                                fontFamily: 'Pacifico',
                                color: Colors.black,
                                fontSize: 20)),
                        const SizedBox(height: 16),
                        const Text(
                            'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                            maxLines: 2,
                            style: TextStyle(fontSize: 14)),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFA451),
                                  borderRadius: BorderRadius.circular(6)),
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: const Text('Let`s Continue',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Pacifio',
                                      fontSize: 17)),
                            ),
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Expanded(
                  child: Image.asset('assets/images/frut2.JPG',
                      fit: BoxFit.fitWidth)),
              Expanded(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 17, right: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('What`s Your Firstname?',
                            style: TextStyle(
                                fontFamily: 'Pacifico',
                                color: Colors.black,
                                fontSize: 20)),
                        const Spacer(flex: 1),
                        Container(
                          width: 300,
                          color: Colors.grey[100],
                          child: TextFormField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              hintText: 'Tony',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Spacer(flex: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: GestureDetector(
                            onTap: () async {
                              String name = _controller.text;
                              await DatabaseHelper().insertUser(name);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFA451),
                                  borderRadius: BorderRadius.circular(6)),
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: const Text('Start Ordering',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Pacifio',
                                      fontSize: 17)),
                            ),
                          ),
                        ),
                        const Spacer(flex: 2)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
