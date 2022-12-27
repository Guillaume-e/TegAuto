import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/car.dart';
import 'package:teg_auto/model/car_list.dart';
import 'package:teg_auto/pages/add_car_sale_page.dart';
import 'package:teg_auto/widgets/homecard.dart';
import 'package:teg_auto/widgets/homecardvar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initialiseCarList() async {
    final CarsList carListRef = context.read<CarsList>();
    final List<Car> allCarList = await carListRef.getCarListFromDatabase();
    carListRef.setCarList(allCarList);
  }

  @override
  void initState() {
    initialiseCarList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 900) {
              return Consumer<CarsList>(
                builder: (BuildContext context, CarsList value, Widget? child) {
                  return GridView.builder(
                    itemCount: value.getCarsList().length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 50,
                      crossAxisSpacing: 50,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return HomeCardVar(
                        card: value.getCarsList()[index],
                        index: index,
                      );
                    },
                  );
                },
              );
            } else {
              return Consumer<CarsList>(
                builder: (BuildContext context, CarsList value, Widget? child) {
                  return GridView.builder(
                    itemCount: value.getCarsList().length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 35,
                    ),
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return HomeCard(
                        card: value.getCarsList()[index],
                        index: index,
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
