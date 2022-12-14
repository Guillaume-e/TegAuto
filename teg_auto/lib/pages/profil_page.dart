import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/car_list.dart';
import 'package:teg_auto/model/user.dart';
import 'package:teg_auto/model/user_list.dart';
import 'package:teg_auto/widgets/ban_information.dart';
import 'package:teg_auto/widgets/profil_widget.dart';
import 'package:teg_auto/widgets/sale_information.dart';

const List<List<String>> datauser = <List<String>>[
  <String>[
    "https://www.bmw.fr/content/dam/bmw/common/all-models/m-series/m8-coupe/2022/onepager/bmw-m8-coupe-onepager-sp-desktop.jpg",
    "Toto",
    "david974@km.re",
  ],
  <String>[
    "https://www.bmw.fr/content/dam/bmw/common/all-models/m-series/m8-coupe/2022/onepager/bmw-m8-coupe-onepager-sp-desktop.jpg",
    "Toto",
    "david974@km.re",
  ]
];

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key, required this.title});

  final String title;
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isAdmin = context.watch<UserManagement>().getIsAdminStatus();
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
              SizedBox(height: size.height * 0.025),
              Material(
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicatorWeight: 1,
                  indicatorColor: Colors.blue,
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(
                        isAdmin ? Icons.block : Icons.favorite,
                        size: 40,
                      ),
                    ),
                    const Tab(
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
                    if (isAdmin)
                      ChangeNotifierProvider<UserManagementList>(
                        create: (_) => UserManagementList(),
                        child: const BanCard(listCard: datauser),
                      ) // const BanCard(listCard: datauser)
                    else
                      SaleCard(
                        listCard: context
                            .watch<UserManagement>()
                            .getFavoritesUserCars(),
                        isSellList: false,
                      ),
                    if (isAdmin)
                      SaleCard(
                        listCard: context.watch<CarsList>().getCarsList(),
                        isSellList: true,
                      )
                    else
                      SaleCard(
                        listCard:
                            context.watch<UserManagement>().getCarsToSell(),
                        isSellList: true,
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
