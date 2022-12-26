import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/user.dart';
import 'package:teg_auto/widgets/profil_widget.dart';
import 'package:teg_auto/widgets/sale_information.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key, required this.title});

  final String title;
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.blue),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, _) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Consumer<UserManagement>(
                      builder: (
                        BuildContext context,
                        UserManagement connectedUser,
                        Widget? child,
                      ) {
                        return ProfileWidget(
                          imagePath: connectedUser.getImagePath(),
                          name: connectedUser.getName(),
                          email: connectedUser.getEmail(),
                        );
                      },
                    )
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              const SizedBox(height: 30),
              const Material(
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicatorWeight: 1,
                  indicatorColor: Colors.orange,
                  tabs: <Widget>[
                    Tab(
                      text: "Favorites",
                      icon: Icon(
                        Icons.favorite,
                        size: 40,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.my_library_books,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    SaleCard(
                      listCard: context.watch<UserManagement>().getCarsToSell(),
                    ),
                    SaleCard(
                      listCard: context
                          .watch<UserManagement>()
                          .getFavoritesUserCars(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
