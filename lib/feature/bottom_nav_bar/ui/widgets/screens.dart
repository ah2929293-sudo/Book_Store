// import 'package:book_store/feature/home/cubit/cubit/home_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Screens extends StatelessWidget {
//   const Screens({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//     create: (context) => HomeCubit()
//       ..getSlider()
//       ..getBestSeller(),
//     child: Scaffold(
//       body: screens[activeIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: activeIndex,
//         onTap: (index) {
//           setState(() {
//             activeIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
//           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     ),
//   );
// };
//   }
// }
