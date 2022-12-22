import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teg_auto/model/car.dart';
import 'package:teg_auto/model/user.dart';
import 'package:teg_auto/widgets/profil_widget.dart';
import 'package:teg_auto/widgets/sale_information.dart';

const List<Car> data = <Car>[
  Car(
    image:
        "https://www.bmw.fr/content/dam/bmw/common/all-models/m-series/m8-coupe/2022/onepager/bmw-m8-coupe-onepager-sp-desktop.jpg",
    brand: "Bmw",
    model: "M8 Competition",
    price: "100000",
    km: "10",
    color: "Blue",
    state: "New",
    details:
        "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  ),
  Car(
    image:
        "https://cdn.motor1.com/images/mgl/8bpn2/s1/4x3/2018-porsche-911-gt3-rs.webp",
    brand: "Porsche",
    model: "911 GT3 RS",
    price: "90000",
    km: "30K",
    color: "Green",
    state: "Used",
    details:
        "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  ),
  Car(
    image:
        "https://cdn.motor1.com/images/mgl/AkBOMx/s1/lamborghini-urus-by-mansory-and-mtm.jpg",
    brand: "Lamborghini",
    model: "Urus",
    price: "190000",
    km: "0",
    color: "Yellow",
    state: "New",
    details:
        "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  )
];

const List<Car> data2 = <Car>[
  Car(
    image:
        "https://www.bmw.fr/content/dam/bmw/common/all-models/m-series/m8-coupe/2022/onepager/bmw-m8-coupe-onepager-sp-desktop.jpg",
    brand: "Bmw",
    model: "M8 Competition",
    price: "100000",
    km: "10",
    color: "Blue",
    state: "New",
    details:
        "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  ),
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
            children: const <Widget>[
              SizedBox(height: 30),
              Material(
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicatorWeight: 1,
                  indicatorColor: Colors.orange,
                  tabs: <Widget>[
                    Tab(
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
                    SaleCard(listCard: data),
                    SaleCard(listCard: data2),
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
