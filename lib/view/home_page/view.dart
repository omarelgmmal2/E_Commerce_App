import 'package:e_commerce_app/view/home_page/model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final openDrawer = GlobalKey<ScaffoldState>();

  List<FeaturedModel> list = [
    FeaturedModel(
      image: "assets/images/man.jpg",
      text: "Man Long T_Shirt",
      price: 300.0,
    ),
    FeaturedModel(
      image: "assets/images/women.jpg",
      text: "women Long T_Shirt",
      price: 320.0,
    ),
  ];

  List<ItemModel> item = [
    ItemModel(
      image: "assets/images/camera.jpg",
      text: "camera",
      price: 300.0,
    ),
    ItemModel(
      image: "assets/images/shopping.png",
      text: "shopping",
      price: 320.0,
    ),
  ];

  List<CategorieModel> model = [
    CategorieModel(
      image: "https://3ezh.net/wp-content/uploads/2019/07/2307-2.jpg",
    ),
    CategorieModel(
      image:
          "https://static.cdn.asset.aparat.com/avt/8602747-5290-b__574898473.jpg",
    ),
    CategorieModel(
      image: "https://photos-images.org/wp-content/uploads/2018/03/1255.jpg",
    ),
    CategorieModel(
      image: "https://photos-images.org/wp-content/uploads/2018/03/1246-1.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: openDrawer,
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("HomePage"),
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          onPressed: () {
            openDrawer.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(
            height: 120,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Search something",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 163 / 250,
            ),
            itemBuilder: (context, index) => _CustomCard(
              model: list[index],
            ),
            itemCount: list.length,
          ),
          const SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categorie",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => _ItemCategorie(
                      model: model[index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 3,
                    ),
                    itemCount: model.length,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Achives",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "See all",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 163 / 250,
            ),
            itemBuilder: (context, index) => _ItemCard(
              model: item[index],
            ),
            itemCount: list.length,
          ),
        ],
      ),
    );
  }
}

class _ItemCategorie extends StatelessWidget {
  final CategorieModel model;

  const _ItemCategorie({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 45,
      backgroundColor: const Color(0xff33dcfd),
      child: Image.network(
        model.image,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  final FeaturedModel model;

  const _CustomCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: SizedBox(
                height: 250,
                width: 165,
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      width: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            model.image,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      model.price.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9b96d6),
                      ),
                    ),
                    Text(
                      model.text,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9b96d6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ItemCard extends StatelessWidget {
  final ItemModel model;

  const _ItemCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: SizedBox(
                height: 250,
                width: 165,
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      width: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            model.image,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      model.price.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9b96d6),
                      ),
                    ),
                    Text(
                      model.text,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9b96d6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
