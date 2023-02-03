import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_cat/second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, John',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromARGB(255, 86, 81, 81),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: 90,
                width: double.infinity,
                child: ListTile(
                  leading: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          const CircleAvatar(
                            radius: 23.0,
                            backgroundImage: NetworkImage(
                                'https://cdn2.iconfinder.com/data/icons/avatar-2/512/oscar_boy-512.png'),
                          ),
                          Stack(
                              alignment: AlignmentDirectional.center,
                              children: const [
                                CircleAvatar(
                                  radius: 9,
                                  backgroundColor: Colors.white,
                                ),
                                CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.green,
                                ),
                              ]),
                        ],
                      ),
                    ],
                  ),
                  title: const Text(
                    'YOUR BALANCE',
                    style: TextStyle(color: Colors.orange, fontSize: 15),
                  ),
                  subtitle: const Text(
                    '\$23,052.82',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: SecondPage(),
                            type: PageTransitionType.rightToLeft));
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Achievements',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 171,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'see All',
                        style: TextStyle(color: Colors.orange),
                      )),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      color: const Color.fromARGB(255, 250, 171, 53),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://images.emojiterra.com/google/noto-emoji/v2.034/512px/1f4a3.png',
                                width: 45,
                                height: 45,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              const Text(
                                '1 week streak',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                      ),
                    ),
                    Card(
                      color: const Color.fromARGB(255, 146, 240, 149),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/whatsapp/326/snake_1f40d.png',
                                width: 45,
                                height: 45,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              const Text(
                                '3 week streak',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                      ),
                    ),
                    Card(
                      color: const Color.fromARGB(255, 119, 218, 238),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Emoji_u1f4aa.svg/1024px-Emoji_u1f4aa.svg.png',
                                width: 45,
                                height: 45,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              const Text(
                                '7 week streak',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                      ),
                    ),
                    Card(
                      color: const Color.fromARGB(255, 247, 172, 197),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://emoji-uc.akamaized.net/orig/57/6cf95bdae6ae313daa7441794fa2be.png',
                                width: 45,
                                height: 45,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              const Text(
                                '12 week streak',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                      ),
                    ),
                    Card(
                      color: const Color.fromARGB(255, 249, 236, 118),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://static-00.iconduck.com/assets.00/fire-emoji-402x512-8ma95d17.png',
                                width: 45,
                                height: 45,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              const Text(
                                '20 week streak',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                      ),
                    ),
                    Card(
                      color: const Color.fromARGB(255, 138, 144, 250),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://emojipedia-us.s3.amazonaws.com/source/skype/289/globe-showing-americas_1f30e.png',
                                width: 45,
                                height: 45,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              const Text(
                                '30 week streak',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Investment portfolio',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 117,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'see All',
                        style: TextStyle(color: Colors.orange),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.count(
                  primary: false,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.30,
                  crossAxisCount: 2,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color.fromARGB(255, 86, 81, 81),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Apple_logo_white.svg/1200px-Apple_logo_white.svg.png',
                                height: 30,
                                width: 30,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 45,
                              ),
                              DropdownButton(
                                underline: Container(height: 0.0),
                                items: <String>['One', 'Two', 'Three', 'Four']
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newVal) {},
                                icon: const Icon(
                                  Icons.more_vert,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Apple',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '\$20.253.985',
                            style: TextStyle(
                                color: Color.fromARGB(255, 171, 168, 168),
                                fontSize: 12),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 7.0),
                            child: const ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                              child: LinearProgressIndicator(
                                minHeight: 8,
                                value: 0.7,
                                backgroundColor:
                                    Color.fromARGB(255, 171, 168, 168),
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color.fromARGB(255, 86, 81, 81),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'A',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 40),
                              ),
                              const SizedBox(
                                width: 45,
                              ),
                              DropdownButton(
                                underline: Container(height: 0.0),
                                items: <String>['One', 'Two', 'Three', 'Four']
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newVal) {},
                                icon: const Icon(
                                  Icons.more_vert,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Activision Blozzard',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '\$2.120.585',
                            style: TextStyle(
                                color: Color.fromARGB(255, 171, 168, 168),
                                fontSize: 12),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 7.0),
                            child: const ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                              child: LinearProgressIndicator(
                                minHeight: 8,
                                value: 0.5,
                                backgroundColor:
                                    Color.fromARGB(255, 171, 168, 168),
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color.fromARGB(255, 86, 81, 81),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://www.pngmart.com/files/22/White-PNG-File.png',
                                height: 30,
                                width: 30,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 45,
                              ),
                              DropdownButton(
                                underline: Container(height: 0.0),
                                items: <String>['One', 'Two', 'Three', 'Four']
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newVal) {},
                                icon: const Icon(
                                  Icons.more_vert,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'AMD',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '\$1.120.30',
                            style: TextStyle(
                                color: Color.fromARGB(255, 171, 168, 168),
                                fontSize: 12),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 7.0),
                            child: const ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                              child: LinearProgressIndicator(
                                minHeight: 8,
                                value: 0.3,
                                backgroundColor:
                                    Color.fromARGB(255, 171, 168, 168),
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color.fromARGB(255, 86, 81, 81),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'V',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 40),
                              ),
                              const SizedBox(
                                width: 45,
                              ),
                              DropdownButton(
                                underline: Container(height: 0.0),
                                items: <String>['One', 'Two', 'Three', 'Four']
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newVal) {},
                                icon: const Icon(
                                  Icons.more_vert,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Value',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '\$13.150.185',
                            style: TextStyle(
                                color: Color.fromARGB(255, 171, 168, 168),
                                fontSize: 12),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 7.0),
                            child: const ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0)),
                              child: LinearProgressIndicator(
                                minHeight: 8,
                                value: 0.6,
                                backgroundColor:
                                    Color.fromARGB(255, 171, 168, 168),
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
