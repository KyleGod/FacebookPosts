import 'package:flutter/material.dart';
import '../screens/newsfeed_screen.dart';
import '../widgets/customfont.dart';
import '../constants.dart';

class FacebookPost extends StatefulWidget {
  const FacebookPost({super.key});

  @override
  _FacebookPostState createState() => _FacebookPostState();
}

class _FacebookPostState extends State<FacebookPost> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Implement navigation logic here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: CustomFont(
          text: 'facebook',
          fontSize: 25,
          color: FB_PRIMARY,
          fontFamily: 'Klavika',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info & Post Content
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: NetworkImage(
                  "https://scontent.fmnl4-4.fna.fbcdn.net/v/t39.30808-6/481047908_2490559104615086_5278326737450162567_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=c58eb2t2OWUQ7kNvgHiJsMr&_nc_oc=AdhNTspFRhCgJyzX2XbQoDtlfhZ6qsob9gsQmfUZlRSaT-kq2jlnN1uUXPelHJ_T1OC1Ys3ebaXbc1W0czs52Mry&_nc_zt=23&_nc_ht=scontent.fmnl4-4.fna&_nc_gid=nBQWs-kO9-djfv2yWp-jwA&oh=00_AYGUR4TJkZGVLIT7hFW0Zgo974E8qPKMCxeY_wWmlmDt3A&oe=67DCC3F2"),
            ),
            title: const Text("Franz Arnel San Jose",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("October 11"),
            trailing: const Icon(Icons.more_horiz),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("❤😊"),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Text("#hashtag", style: TextStyle(color: Colors.blue)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.network(
              "https://scontent.fmnl4-1.fna.fbcdn.net/v/t51.75761-15/481926805_18445710319072249_3416339953145283369_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=127cfc&_nc_ohc=zRaMpw8e7_MQ7kNvgFrbpAU&_nc_oc=Adgs5pJ62ef6OvHf6I1LRFOOGgCduqCSyCtEmBL0xZUkuWnkJu0wDphtoTZgdD0CczaDfw8vu3PtCs0o7RcudaTd&_nc_zt=23&_nc_ht=scontent.fmnl4-1.fna&_nc_gid=7sK46eM053uUYkoJmHm95g&oh=00_AYENKtUgboiGl5crCstEt4ySm_o9hHzFpGIoqs1TeJj99w&oe=67DCAE7E",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const Divider(),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _actionButton(Icons.thumb_up_alt_outlined, "Like"),
              _actionButton(Icons.mode_comment_outlined, "Comment"),
              _actionButton(Icons.share_rounded, "Share"),
            ],
          ),
          const Divider(),

          // Write a Comment Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(
                      "https://scontent.fmnl4-4.fna.fbcdn.net/v/t39.30808-6/481047908_2490559104615086_5278326737450162567_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=c58eb2t2OWUQ7kNvgHiJsMr&_nc_oc=AdhNTspFRhCgJyzX2XbQoDtlfhZ6qsob9gsQmfUZlRSaT-kq2jlnN1uUXPelHJ_T1OC1Ys3ebaXbc1W0czs52Mry&_nc_zt=23&_nc_ht=scontent.fmnl4-4.fna&_nc_gid=nBQWs-kO9-djfv2yWp-jwA&oh=00_AYGUR4TJkZGVLIT7hFW0Zgo974E8qPKMCxeY_wWmlmDt3A&oe=67DCC3F2"),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Write a comment...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // **News Feed Below the Comment Section**
          const Expanded(child: NewsFeedScreen()),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: FB_PRIMARY,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        
        ],
      ),
    );
  }
}

Widget _actionButton(IconData icon, String label) {
  return TextButton.icon(
    onPressed: () {},
    icon: Icon(icon, color: Colors.grey[800]),
    label: Text(label, style: TextStyle(color: Colors.grey[800])),
  );
}
