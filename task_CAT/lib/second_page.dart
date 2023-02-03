import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

bool posts = false;
bool followers = false;
bool subscribers = false;

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn2.iconfinder.com/data/icons/avatar-2/512/oscar_boy-512.png'),
                radius: 50,
              ),
              const SizedBox(
                height: 17,
              ),
              const Text(
                'John Edwards',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '@marvin_ed',
                style: TextStyle(
                  color: Color.fromARGB(255, 171, 168, 168),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 80,
                      width: 120,
                      // ignore: sort_child_properties_last
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '32',
                              style: TextStyle(
                                  color: posts ? Colors.black : Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22),
                            ),
                            Text(
                              'Posts',
                              style: TextStyle(
                                  color: posts ? Colors.black : Colors.white,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: posts
                            ? const Color.fromARGB(255, 146, 240, 149)
                            : const Color.fromARGB(255, 86, 81, 81),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        posts = true;
                        followers = false;
                        subscribers = false;
                      });
                    },
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 80,
                      width: 120,
                      // ignore: sort_child_properties_last
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '26354',
                              style: TextStyle(
                                  color:
                                      followers ? Colors.black : Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22),
                            ),
                            Text(
                              'followers',
                              style: TextStyle(
                                  color:
                                      followers ? Colors.black : Colors.white,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: followers
                            ? const Color.fromARGB(255, 146, 240, 149)
                            : const Color.fromARGB(255, 86, 81, 81),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        posts = false;
                        followers = true;
                        subscribers = false;
                      });
                    },
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 80,
                      width: 120,
                      // ignore: sort_child_properties_last
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '256',
                              style: TextStyle(
                                  color:
                                      subscribers ? Colors.black : Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22),
                            ),
                            Text(
                              'subscribers',
                              style: TextStyle(
                                  color:
                                      subscribers ? Colors.black : Colors.white,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: subscribers
                            ? const Color.fromARGB(255, 146, 240, 149)
                            : const Color.fromARGB(255, 86, 81, 81),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        posts = false;
                        followers = false;
                        subscribers = true;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  posts
                      ? 'Posts'
                      : followers
                          ? 'Followers'
                          : subscribers
                              ? 'Subscribers'
                              : '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'see All',
                      style: TextStyle(color: Colors.orange),
                    )),
              ]),
              Expanded(
                child: SingleChildScrollView(
                    child: posts
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Color.fromARGB(255, 86, 81, 81),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://cdn2.iconfinder.com/data/icons/avatar-2/512/oscar_boy-512.png'),
                                          radius: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'John Edwards',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              '5 min ago',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 171, 168, 168),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Bought \$300 of Apple',
                                      style: TextStyle(fontSize: 25),
                                      textAlign: TextAlign.start,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        LikeButton(
                                          size: 25,
                                          likeBuilder: (isLiked) {
                                            return Icon(
                                              Icons.favorite,
                                              color: isLiked
                                                  ? Colors.red
                                                  : Colors.white,
                                            );
                                          },
                                          likeCount: 30,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        LikeButton(
                                          size: 25,
                                          likeBuilder: (isLiked) {
                                            return const Icon(
                                                Icons.mode_comment,
                                                color: Colors.white);
                                          },
                                          likeCount: 12,
                                        ),
                                        IconButton(
                                          iconSize: 25,
                                          onPressed: () {},
                                          icon: const Icon(Icons.share),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Color.fromARGB(255, 86, 81, 81),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://cdn-icons-png.flaticon.com/512/163/163834.png'),
                                          radius: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Ropert Murphy',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              '12 hours ago',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 171, 168, 168),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Study says buying a winning stock is easy, just find a cool ticker',
                                      style: TextStyle(fontSize: 25),
                                      textAlign: TextAlign.start,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        LikeButton(
                                          size: 25,
                                          likeBuilder: (isLiked) {
                                            return Icon(
                                              Icons.favorite,
                                              color: isLiked
                                                  ? Colors.red
                                                  : Colors.white,
                                            );
                                          },
                                          likeCount: 56,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        LikeButton(
                                          size: 25,
                                          likeBuilder: (isLiked) {
                                            return const Icon(
                                                Icons.mode_comment,
                                                color: Colors.white);
                                          },
                                          likeCount: 12,
                                        ),
                                        IconButton(
                                          iconSize: 25,
                                          onPressed: () {},
                                          icon: const Icon(Icons.share),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Color.fromARGB(255, 86, 81, 81),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://www.shutterstock.com/image-vector/woman-girl-icon-female-cartoon-260nw-489429121.jpg'),
                                          radius: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Anna Shumaher',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              '4 days ago',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 171, 168, 168),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Bought \$300 of Apple',
                                      style: TextStyle(fontSize: 25),
                                      textAlign: TextAlign.start,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        LikeButton(
                                          size: 25,
                                          likeBuilder: (isLiked) {
                                            return Icon(
                                              Icons.favorite,
                                              color: isLiked
                                                  ? Colors.red
                                                  : Colors.white,
                                            );
                                          },
                                          likeCount: 30,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        LikeButton(
                                          size: 25,
                                          likeBuilder: (isLiked) {
                                            return const Icon(
                                                Icons.mode_comment,
                                                color: Colors.white);
                                          },
                                          likeCount: 12,
                                        ),
                                        IconButton(
                                          iconSize: 25,
                                          onPressed: () {},
                                          icon: const Icon(Icons.share),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 155,
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Color.fromARGB(255, 86, 81, 81),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://i.pinimg.com/originals/55/09/d4/5509d42a7231fa57683cdd7d6ab431ae.png'),
                                          radius: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Mary John',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              '1 week ago',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 171, 168, 168),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Bought \$300 of Apple',
                                      style: TextStyle(fontSize: 25),
                                      textAlign: TextAlign.start,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        LikeButton(
                                          size: 25,
                                          likeBuilder: (isLiked) {
                                            return Icon(
                                              Icons.favorite,
                                              color: isLiked
                                                  ? Colors.red
                                                  : Colors.white,
                                            );
                                          },
                                          likeCount: 60,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        LikeButton(
                                          size: 25,
                                          likeBuilder: (isLiked) {
                                            return const Icon(
                                                Icons.mode_comment,
                                                color: Colors.white);
                                          },
                                          likeCount: 10,
                                        ),
                                        IconButton(
                                          iconSize: 25,
                                          onPressed: () {},
                                          icon: const Icon(Icons.share),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        : followers
                            ? Column(
                                children: [],
                              )
                            : subscribers
                                ? Column(
                                    children: [],
                                  )
                                : null),
              )
            ],
          ),
        ),
      ),
    );
  }
}
