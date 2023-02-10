import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_app/views/navbar/pages/cubit/post_cubit.dart';
import '../../post_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          if (state is PostError) {
            final snackbar = SnackBar(
              content: Text(state.errorMessage),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: state is PostLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: context.read<PostCubit>().posts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: index % 2 == 0 ? Colors.white : Colors.grey[200],
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (newContext) => PostDetails(
                                      post: context
                                          .read<PostCubit>()
                                          .posts[index])),
                            );
                          },
                          leading: Text("${index + 1}"),
                          title: Text(
                              context.read<PostCubit>().posts[index].title),
                          subtitle: Text(
                              "${context.read<PostCubit>().posts[index].userId}"),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      );
                    }),
          );
        },
      ),
    );
  }
}
// Scaffold(
//       body: isLoading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: posts.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   color: index % 2 == 0 ? Colors.white : Colors.grey[200],
//                   child: ListTile(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 PostDetails(post: posts[index])),
//                       );
//                     },
//                     leading: Text("${index + 1}"),
//                     title: Text(posts[index].title),
//                     subtitle: Text("${posts[index].userId}"),
//                     trailing: const Icon(Icons.arrow_forward_ios),
//                   ),
//                 );
//               }),
//     );