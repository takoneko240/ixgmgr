import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  MyPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyPageState createState() => _MyPageState();
}

class Site {
  //--- Name Of City
  late final String name;

  //-- image
  late final String image;

  //--- population
  late final String population;

  //--- country
  late final String country;

  Site(
      {required this.name,
      required this.country,
      required this.population,
      required this.image});

  static List<Site> allSites() {
    List<Site> lstOfCities = [];

    lstOfCities.add(new Site(
        name: "Aichi Prefectural Aichi Hospital",
        country: "Japan",
        population: "19 mill",
        image: "site1.png"));
    lstOfCities.add(new Site(
        name: "Mori Building",
        country: "Japan",
        population: "19 mill",
        image: "site2.png"));
    lstOfCities.add(new Site(
        name: "Laurel Court Katsukawa",
        country: "Japan",
        population: "19 mill",
        image: "site3.png"));
    lstOfCities.add(new Site(
        name: "Trunp Tower",
        country: "United States of America",
        population: "19 mill",
        image: "site4.png"));

    return lstOfCities;
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                author,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$publishDate - $readDuration',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 1.0,
              offset: Offset(10, 10))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.0,
                child: thumbnail,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                  child: _ArticleDescription(
                    title: title,
                    subtitle: subtitle,
                    author: author,
                    publishDate: publishDate,
                    readDuration: readDuration,
                  ),
                ),
              ),
              Container(
                width: 200,
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(EdgeInsets.all(12.0)),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('深刻なエラー'),
                          content: Text(
                              '予算と権限が足りません。\nこのシステムを完成させるには、ソフトウェア開発部に企画権限と予算を与えてください。'),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text('Cancel'),
                              onPressed: () => Navigator.of(context).pop(0),
                            ),
                            ElevatedButton(
                              child: Text('OK'),
                              onPressed: () => Navigator.of(context).pop(1),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("Edit", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyPageState extends State<MyPage> with TickerProviderStateMixin {
  List<Site> _sites = Site.allSites();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  // First Attempt
  Widget _getItemUI(BuildContext context, int index) {
    return CustomListItemTwo(
      thumbnail: Image.asset(
        "images/" + _sites[index].image,
        fit: BoxFit.cover,
        width: 200.0,
        height: 200.0,
      ),
      title: _sites[index].name,
      subtitle: '',
      author: _sites[index].country,
      publishDate: 'Feb 26',
      readDuration: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            new Container(
              child: new Tab(text: 'Systems', icon: Icon(Icons.apartment)),
            ),
            new Container(
              child: new Tab(text: 'Tools', icon: Icon(Icons.settings)),
            ),
            new Container(
              child: new Tab(text: 'Account', icon: Icon(Icons.person)),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(20.0)),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                  title: Text("Select System Type"),
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(20.0),
                                      width: 600,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                  "images/bussiness.png",
                                                  width: 200),
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                    MaterialStateProperty
                                                        .all(Colors.blue),
                                                    padding:
                                                    MaterialStateProperty
                                                        .all(EdgeInsets
                                                        .all(20.0)),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, "/second");
                                                  },
                                                  child:
                                                  Row(children:[
                                                    Text("bussiness"),
                                                    new Tooltip(
                                                      textStyle: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                      padding:
                                                      EdgeInsets.all(10),
                                                      message:
                                                      "Complex call settings are possible.Since there is no concept of room or group entrance, terminals for group systems (IXG-2C7, IXG-DM7, IXG-LC, IXG-MK) cannot be connected.",
                                                      child:
                                                      new Icon(Icons.help),),
                                                  ])
                                              ),

                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Image.asset(
                                                  "images/apartment.png",
                                                  width: 200),
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors.blue),
                                                      padding:
                                                          MaterialStateProperty
                                                              .all(EdgeInsets
                                                                  .all(20.0)),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pushNamed(context, "/apartment");
                                                    },
                                                    child:
                                                      Row(children:[
                                                        Text("Apartment"),
                                                        new Tooltip(
                                                          textStyle: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors.white),
                                                          padding:
                                                          EdgeInsets.all(10),
                                                          message:
                                                          "This system is designed for apartment complexes.\nIt is suitable for properties where rooms are called from the assembly entrance.",
                                                          child:
                                                          new Icon(Icons.help),),
                                                      ])
                                                  ),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]);
                            },
                          );
                        },
                        child: Text("Create New System",
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _sites.length,
                        itemBuilder: _getItemUI,
                        padding: EdgeInsets.all(0.0),
                      ),
                    ),
                  ],
                ),
                width: 1000),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              padding: const EdgeInsets.only(
                  top: 40, left: 40, right: 40, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          enabled: false,
                          initialValue: "Administrator",
                          keyboardType: TextInputType.emailAddress,
                          // Use email input type for emails.
                          decoration: new InputDecoration(
                              hintText: 'you@example.com', labelText: 'ID'),
                        ),
                        TextFormField(
                          enabled: true,
                          initialValue: "you@example.com",
                          keyboardType: TextInputType.emailAddress,
                          // Use email input type for emails.
                          decoration: new InputDecoration(
                              hintText: 'you@example.com', labelText: 'Email'),
                        ),
                        TextFormField(
                          enabled: true,
                          initialValue: "**********",
                          keyboardType: TextInputType.emailAddress,
                          // Use email input type for emails.
                          decoration: new InputDecoration(
                              hintText: '********', labelText: 'Password'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(20.0)),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('深刻なエラー'),
                              content: Text('作っていないので動きません。'),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: Text('Cancel'),
                                  onPressed: () => Navigator.of(context).pop(0),
                                ),
                                ElevatedButton(
                                  child: Text('OK'),
                                  onPressed: () => Navigator.of(context).pop(1),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        "Change",
                      ),
                    ),
                  ),
                ],
              ),
              width: 500,
            ),
          ),
        ],
      ),
    );
  }
}
