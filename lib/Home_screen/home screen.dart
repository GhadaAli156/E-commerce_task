import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../cart/combo_list.dart';
import '../database/DatabaseHelper.dart';
import '../model/combo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? name;
  List<Combo> combos = [];

  @override
  void initState() {
    super.initState();
    _fetchUserName();
    _fetchCombos();
    _insertSampleCombos();
  }

  Future<void> _fetchUserName() async {
    String? userName = await DatabaseHelper().getUserName();
    setState(() {
      name = userName;
    });
  }

  Future<void> _fetchCombos() async {
    List<Combo> fetchedCombos = (await DatabaseHelper().getCombo()).cast<Combo>();
    setState(() {
      combos = fetchedCombos;
    });
  }

  Future<void> _insertSampleCombos() async {
    final existingCombos = await DatabaseHelper().getCombo();
    if (existingCombos.isEmpty) {
      await DatabaseHelper().insertCombo('Honey lime combo', '₦ 2,000', 'assets/images/f1.JPG');
      await DatabaseHelper().insertCombo('Berry mango combo', '₦ 8,000', 'assets/images/f2.JPG');
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.segment, size: 30, color: Colors.black),
        actions: const [
          Padding(
            padding:  EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Icon(CupertinoIcons.cart, color: Color(0xffFFA451), size: 30),
                Text(
                  'My basket',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.black,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Hello $name ', style: const TextStyle(fontSize: 16)),
                      const Text('What fruit salad', style: TextStyle(fontSize: 20, fontFamily: 'Pacifico')),
                    ],
                  ),
                  const Text(
                    'Combo do you want today?',
                    style: TextStyle(fontSize: 20, fontFamily: 'Pacifico'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 300,
                    color: Colors.grey[100],
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.search),
                        hintText: 'Search for fruit salad combo',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Image.asset('assets/images/switch.JPG'),
                ],
              ),
              const SizedBox(height: 25),
              const Text(
                'Recommended Combo',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const ComboList(
                combos: [
                  {'name': 'Honey lime combo', 'price': '₦ 2,000', 'image': 'assets/images/f2.JPG'},
                  {'name': 'Berry mango combo', 'price': '₦ 8,000', 'image': 'assets/images/f1.JPG'},
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hottest',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('Popular', style: TextStyle(fontSize: 18, color: Colors.grey)),
                  Text('New combo', style: TextStyle(fontSize: 18, color: Colors.grey)),
                  Text('Top', style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 10),
              const ComboList(
                combos: [
                  {'name': 'Honey lime combo', 'price': '₦ 2,000', 'image': 'assets/images/f3.JPG'},
                  {'name': 'Berry mango combo', 'price': '₦ 8,000', 'image': 'assets/images/f4.JPG'},
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
