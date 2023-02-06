import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                const CircleAvatar(
                  radius: 23.0,
                  backgroundImage: AssetImage('assets/profile.jpeg'),
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: const [
                    CircleAvatar(
                      radius: 8.0,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                      radius: 7.0,
                      backgroundColor: Colors.green,
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              width: 15.0,
            ),
            const Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(35.0),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              const CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage('assets/m1.jpeg'),
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: const [
                                  CircleAvatar(
                                    radius: 9.0,
                                    backgroundColor: Colors.white,
                                  ),
                                  CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          const Text(
                            'Zainab Hamdy',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              const CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage('assets/m2.jpeg'),
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: const [
                                  CircleAvatar(
                                    radius: 9.0,
                                    backgroundColor: Colors.white,
                                  ),
                                  CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          const Text(
                            'Rana Ashraf',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              const CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage('assets/m3.jpeg'),
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: const [
                                  CircleAvatar(
                                    radius: 9.0,
                                    backgroundColor: Colors.white,
                                  ),
                                  CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          const Text(
                            'ميادة محمد',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              const CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage('assets/m5.jpeg'),
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: const [
                                  CircleAvatar(
                                    radius: 9.0,
                                    backgroundColor: Colors.white,
                                  ),
                                  CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          const Text(
                            'Aya Farid AbdelKareem',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              const CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage('assets/m7.jpeg'),
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: const [
                                  CircleAvatar(
                                    radius: 9.0,
                                    backgroundColor: Colors.white,
                                  ),
                                  CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          const Text(
                            'Yasmin Adel',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              const CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage('assets/m8.jpeg'),
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: const [
                                  CircleAvatar(
                                    radius: 9.0,
                                    backgroundColor: Colors.white,
                                  ),
                                  CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          const Text(
                            'Sara Fathi',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              const CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage('assets/m9.jpeg'),
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: const [
                                  CircleAvatar(
                                    radius: 9.0,
                                    backgroundColor: Colors.white,
                                  ),
                                  CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          const Text(
                            'Eman Reda',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              const CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage('assets/m10.jpeg'),
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: const [
                                  CircleAvatar(
                                    radius: 9.0,
                                    backgroundColor: Colors.white,
                                  ),
                                  CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          const Text(
                            'Maha Ashraf',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              const CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage('assets/m11.jpeg'),
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: const [
                                  CircleAvatar(
                                    radius: 9.0,
                                    backgroundColor: Colors.white,
                                  ),
                                  CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          const Text(
                            'Sarah Elsayed',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/m1.jpeg'),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          CircleAvatar(
                            radius: 9.0,
                            backgroundColor: Colors.white,
                          ),
                          CircleAvatar(
                            radius: 7.0,
                            backgroundColor: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Zainab Hamdy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Text(
                              'Hello my name is Zainab Hamdy',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 7.0,
                                height: 7.0,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                              ),
                            ),
                            const Text('02:00 pm'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/m2.jpeg'),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          CircleAvatar(
                            radius: 9.0,
                            backgroundColor: Colors.white,
                          ),
                          CircleAvatar(
                            radius: 7.0,
                            backgroundColor: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rana Ashraf',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Text(
                              'How are you?',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 7.0,
                                height: 7.0,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                              ),
                            ),
                            const Text('06:34 pm'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/m3.jpeg'),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          CircleAvatar(
                            radius: 9.0,
                            backgroundColor: Colors.white,
                          ),
                          CircleAvatar(
                            radius: 7.0,
                            backgroundColor: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'ميادة محمد',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Text(
                              'كلميني لما تكوني فاضية !',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 7.0,
                                height: 7.0,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                              ),
                            ),
                            const Text('Tue'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: const [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/m4.jpeg'),
                      ),
                      // Stack(
                      //   alignment: AlignmentDirectional.center,
                      //   children: const [
                      //     CircleAvatar(
                      //       radius: 9.0,
                      //       backgroundColor: Colors.white,
                      //     ),
                      //     CircleAvatar(
                      //       radius: 7.0,
                      //       backgroundColor: Colors.green,
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Asmaa AbdElwahab',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Text(
                              'عاملة ايه النهاردة ♡♡♡؟',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 7.0,
                                height: 7.0,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                              ),
                            ),
                            const Text('Tue'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/m5.jpeg'),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          CircleAvatar(
                            radius: 9.0,
                            backgroundColor: Colors.white,
                          ),
                          CircleAvatar(
                            radius: 7.0,
                            backgroundColor: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Aya Farid AbdElkareem',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Text(
                              'فرحت جدا اننا اتقابلنا النهاردة ♡',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 7.0,
                                height: 7.0,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                              ),
                            ),
                            const Text('Wed'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: const [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/m6.jpeg'),
                      ),
                      // Stack(
                      //   alignment: AlignmentDirectional.center,
                      //   children: const [
                      //     CircleAvatar(
                      //       radius: 9.0,
                      //       backgroundColor: Colors.white,
                      //     ),
                      //     CircleAvatar(
                      //       radius: 7.0,
                      //       backgroundColor: Colors.green,
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rana A. Sheta',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Text(
                              'ماما بتسلم عليكي',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 7.0,
                                height: 7.0,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                              ),
                            ),
                            const Text('Fri'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/m7.jpeg'),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          CircleAvatar(
                            radius: 9.0,
                            backgroundColor: Colors.white,
                          ),
                          CircleAvatar(
                            radius: 7.0,
                            backgroundColor: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Yasmin Adel',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Text(
                              'Hello my name is Yasmin Adel',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 7.0,
                                height: 7.0,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                              ),
                            ),
                            const Text('Nov 27'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/m8.jpeg'),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          CircleAvatar(
                            radius: 9.0,
                            backgroundColor: Colors.white,
                          ),
                          CircleAvatar(
                            radius: 7.0,
                            backgroundColor: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Zainab Hamdy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Text(
                              'Hello my name is Zainab Hamdy',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 7.0,
                                height: 7.0,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                              ),
                            ),
                            const Text('02:00 pm'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/m1.jpeg'),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          CircleAvatar(
                            radius: 9.0,
                            backgroundColor: Colors.white,
                          ),
                          CircleAvatar(
                            radius: 7.0,
                            backgroundColor: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Zainab Hamdy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Text(
                              'Hello my name is Zainab Hamdy',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 7.0,
                                height: 7.0,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                              ),
                            ),
                            const Text('02:00 pm'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/m1.jpeg'),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          CircleAvatar(
                            radius: 9.0,
                            backgroundColor: Colors.white,
                          ),
                          CircleAvatar(
                            radius: 7.0,
                            backgroundColor: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Zainab Hamdy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Text(
                              'Hello my name is Zainab Hamdy',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 7.0,
                                height: 7.0,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                              ),
                            ),
                            const Text('02:00 pm'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/m1.jpeg'),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: const [
                          CircleAvatar(
                            radius: 9.0,
                            backgroundColor: Colors.white,
                          ),
                          CircleAvatar(
                            radius: 7.0,
                            backgroundColor: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Zainab Hamdy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Text(
                              'Hello my name is Zainab Hamdy',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 7.0,
                                height: 7.0,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                              ),
                            ),
                            const Text('02:00 pm'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
