import 'package:flutter/material.dart';
import 'package:teg_auto/model/itemcard.dart';
import 'package:teg_auto/model/user.dart';
import 'package:teg_auto/widgets/profil_widget.dart';
import 'package:teg_auto/widgets/sale_information.dart';

import '../widgets/ban_information.dart';
/*
class UserData {
  static User myUser = const User(
    imagePath: "https://static.vecteezy.com/ti/vecteur-libre/p3/2275847-male-avatar-profil-icone-de-souriant-caucasien-homme-vectoriel.jpg",
    name: "Guillaume EP",
    email: "guillaume.erem@gmail.com",
    isAdmin: false,
  
  );
}
*/

const List<ItemCard> datacar = <ItemCard>[
    ItemCard(
  image: "https://www.bmw.fr/content/dam/bmw/common/all-models/m-series/m8-coupe/2022/onepager/bmw-m8-coupe-onepager-sp-desktop.jpg",
  brand: "Bmw",
  model: "M8 Competition",
  price: "100000",
  km: "10",
  color: "Blue",
  state: "New",
  details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  ),
    ItemCard(
  image: "https://cdn.motor1.com/images/mgl/8bpn2/s1/4x3/2018-porsche-911-gt3-rs.webp",
  brand: "Porsche",
  model: "911 GT3 RS",
  price: "90000",
  km: "30K",
  color: "Green",
  state: "Used",
  details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  ),
    ItemCard(
    image: "https://cdn.motor1.com/images/mgl/AkBOMx/s1/lamborghini-urus-by-mansory-and-mtm.jpg",
  brand: "Lamborghini",
  model: "Urus",
  price: "190000",
  km: "0",
  color: "Yellow",
  state: "New",
  details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  )
];

const List<ItemCard> datacar2 = <ItemCard>[
    ItemCard(
  image: "https://www.bmw.fr/content/dam/bmw/common/all-models/m-series/m8-coupe/2022/onepager/bmw-m8-coupe-onepager-sp-desktop.jpg",
  brand: "Bmw",
  model: "M8 Competition",
  price: "100000",
  km: "10",
  color: "Blue",
  state: "New",
  details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  ),
    ItemCard(
  image: "https://cdn.motor1.com/images/mgl/8bpn2/s1/4x3/2018-porsche-911-gt3-rs.webp",
  brand: "Porsche",
  model: "911 GT3 RS",
  price: "90000",
  km: "30K",
  color: "Green",
  state: "Used",
  details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  ),
    ItemCard(
    image: "https://cdn.motor1.com/images/mgl/AkBOMx/s1/lamborghini-urus-by-mansory-and-mtm.jpg",
  brand: "Lamborghini",
  model: "Urus",
  price: "190000",
  km: "0",
  color: "Yellow",
  state: "New",
  details: "Dans les textes non linéaires, généralement tabulaires, il est difficile de parler de paragraphes : la page est composée de tables ou de tableaux, de graphes et d'histogrammes, d'images (de photographies, de dessins, ou de schémas, etc.), où les informations textuelles figurent dans des pavés de type légende, commentaire, note, etc., chaque segment de texte étant plus ou moins indépendant des autres, et rattaché à un élément non textuel. Il vaut mieux dans ce cas parler de pavé(s), et envisager la composition du document sous l'angle de la topologie (de la mise en page(s))",
  )
];

const List<List<String>> datauser = <List<String>>[
  [
  "https://www.bmw.fr/content/dam/bmw/common/all-models/m-series/m8-coupe/2022/onepager/bmw-m8-coupe-onepager-sp-desktop.jpg",
  "Toto",
  "david974@km.re",
  ],
  [
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
  bool isAdmin = false;
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
                delegate: SliverChildListDelegate( <Widget>[
                  //ProfileWidget(imagePath: user.imagePath, name: user.name, email: user.email),
                  const ProfileWidget(imagePath: "https://static.vecteezy.com/ti/vecteur-libre/p3/2275847-male-avatar-profil-icone-de-souriant-caucasien-homme-vectoriel.jpg", name: "Guillaume EP", email: "guillaume.erem@gmail.com"),

                  ],
                ),
              ),
            ];
          },
      body: Column(
        children: <Widget> [
          const SizedBox(height: 30),
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
                    Icons.my_library_books ,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                if (isAdmin) const BanCard(listCard: datauser) else const SaleCard(listCard: datacar),
                const SaleCard(listCard: datacar2),
              ],
            ),
          ),
        ],
      ),
    ),
  ),);  
  }
}
