import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/car_list.dart';
import 'package:teg_auto/pages/add_car_sale_page.dart';
import 'package:teg_auto/widgets/homecard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final CarsList dataList = context.watch<CarsList>();

    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<AddCarSale>(
              builder: (BuildContext context) => const AddCarSale(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          fixedSize: const Size(70, 70),
        ),
        child: const Icon(Icons.add_circle_outline, size: 40),
      ),
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.blue),
      body: Container(
        decoration: const BoxDecoration(color: Colors.grey),
        child: GridView.builder(
          itemCount: dataList.getCarsList().length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 50,
          ),
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return HomeCard(
              card: dataList.getCarsList()[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}
