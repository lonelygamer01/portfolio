import 'package:flutter/material.dart';
import 'styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      title: 'Flutter Web Anchors Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController(); // Görgető vezérlő
  final Map<String, GlobalKey> _sectionKeys = {
    'about': GlobalKey(),
    'projects': GlobalKey(),
    'findme': GlobalKey(),
  };

  // Szekcióra ugrás a kulcs alapján
  void _scrollToSection(String section) {
    final keyContext = _sectionKeys[section]?.currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 500), // Görgetési idő
        curve: Curves.easeInOut,       // Görgetési görbe
      );
    }
  }

  late Widget themeicon;
  late Color theme;
  late Color textcolor;

  @override
  void initState() {
    super.initState();
    themeicon = lightthemeicon;
    theme = lighttheme;
    textcolor = darktheme;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: theme,
      appBar: AppBar(
        backgroundColor: theme,
        title: Row(
          children: [
            // Menüelemek
            TextButton(
              onPressed: () => _scrollToSection('about'),
              child: Text('About me', style: TextStyle(color: textcolor, fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () => _scrollToSection('projects'),
              child: Text('Projects', style: TextStyle(color: textcolor,  fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () => _scrollToSection('findme'),
              child: Text('Find me now', style: TextStyle(color: textcolor,  fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                if (themeicon == lightthemeicon) {
                  themeicon = darkthemeicon;
                  theme = darktheme;
                  textcolor = lighttheme;
                } else {
                  themeicon = lightthemeicon;
                  theme = lighttheme;
                  textcolor = darktheme;
                }
              });
            },
            icon: themeicon
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Szekció 1
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              key: _sectionKeys['about'],
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //name
                      Text("Szabó Dániel", style: TextStyle(color: textcolor, fontSize: screenWidth * 0.05 > 38 ? 38 : screenWidth * 0.05),),
                      //random shit
                      SizedBox(width: screenWidth * 0.6,child: Text("A beginner but enthusiastic software developer", style: TextStyle(color: textcolor,fontSize: screenWidth * 0.02 > 18 ? 18 : screenWidth * 0.02 < 16 ? 16 : screenWidth * 0.02),)),
                      //more shit
                      SizedBox(width: screenWidth * 0.6,child: Text("I'm a beginner but enthusiastic software developer living in Hungary who is open to the new technologies. I got into programming when I was 17 with some minor breaks, as a teenager i used many apps and the web so i decided to dig into them and learn how they work.\nI have basic knowledge in web development HTML, CSS, JavaScript.\nDatabases: SQL, XML, JSON.\nBackend: Python, C#, PHP\nMobile development: Flutter\nI'm passionate about working on mobile & desktop applications.", style: TextStyle(color: const Color.fromARGB(255, 114, 114, 114)),)),
                      Container(
                        width: (screenWidth * 0.2) > 130 ? 130 : screenWidth * 0.2,
                        height: (screenWidth * 0.2) > 130 ? 130 : screenWidth * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          //border: Border.all(width: 5, color: theme == lighttheme  ? darktheme : Colors.transparent),
                          shape: BoxShape.circle
                        ),
                      ),
                    ],
                  ),

                ],
              )
            ),
            // Szekció 2
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              key: _sectionKeys['projects'],
              height: 900,
              color: theme,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Projects", style: TextStyle(color: textcolor,fontSize: screenWidth * 0.05 > 40 ? 40 : screenWidth * 0.05),),
                    ],
                  )
                ],
              )
            ),
            // Szekció 3
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              key: _sectionKeys['findme'],
              color: theme,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Find me", style: TextStyle(color: textcolor,fontSize: screenWidth * 0.05 > 40 ? 40 : screenWidth * 0.05),),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Most of my project's code is up on GitHub"),
                  Text("szabo.daniel@tutamail.com / szada.hu@gmail.com"),
                  Text("06/20/919-0095"),
                  //discord
                  //telegram
                  //signal
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
