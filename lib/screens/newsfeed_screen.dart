import 'package:flutter/material.dart';
import '../widgets/newsfeed.dart';
import '../constants.dart';
import '../widgets/customfont.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

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
      body: ListView(
        children: const [
          FacebookPost(), // Integrated Facebook Post
          NewsfeedCard(userName: 'Tanggol Montenegro', postContent: 'Isa pala akong Montenegro!'),
          NewsfeedCard(userName: 'Ramon Montenegro', postContent: 'Nakita na rin kita Tanggol!'),
        ],
      ),
    );
  }
}

class FacebookPost extends StatelessWidget {
  const FacebookPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.black,
            backgroundImage: NetworkImage(
                "https://scontent.fmnl4-4.fna.fbcdn.net/v/t1.15752-9/483607905_1822002668564821_7125980811533670844_n.jpg?stp=dst-jpg_s2048x2048_tt6&_nc_cat=102&ccb=1-7&_nc_sid=9f807c&_nc_eui2=AeE1dz0zUVnTqicCyW5s7VVe4hJwgD7Kd4_iEnCAPsp3jyhVn6JNO0hDzK-CDDUPifYb49lhkREaMNBQjPmzUcla&_nc_ohc=QHAFwu_T5iUQ7kNvgECppyD&_nc_oc=AdhZOvk6a4n2axnbuRg4V4ME4amc2r_GjdyzZAMvGm1wmRoh54k2z_15J-HO-GA7anYY9Lj7QjHW5EZJZnN2BtKB&_nc_zt=23&_nc_ht=scontent.fmnl4-4.fna&oh=03_Q7cD1wHV16AgxVlIGto4YbxhidgcXGMTVMZoi3mzBxbDdeb6wg&oe=68003964"),
          ),
          title: const Text("Kyle Godwin G. Abella",
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Text("September 26 at 6:30"),
          trailing: const Icon(Icons.more_horiz),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("❤"),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Text("#hashtag", style: TextStyle(color: Colors.blue)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.network(
            "https://scontent.fmnl4-2.fna.fbcdn.net/v/t1.15752-9/484302720_1176716937292527_370657873361828368_n.jpg?stp=dst-jpg_s2048x2048_tt6&_nc_cat=101&ccb=1-7&_nc_sid=9f807c&_nc_eui2=AeEkfyQDZf61_OdYL8QbV_DkZR6MbQPUk9hlHoxtA9ST2MsvL4LZz2-q_m7tlrDDb4zyWutCq40tRBmQ4qBkPpVb&_nc_ohc=Br3gfgQYbf4Q7kNvgEXeTGa&_nc_oc=AdgSntiX02PWCzv3Mdb9becDelHtzpOXdb_La1qgUlKmh8I4tELDkm2TOP_TtFT29jnlEEq8_g1Nbd2yV2CcExQp&_nc_zt=23&_nc_ht=scontent.fmnl4-2.fna&oh=03_Q7cD1wFOVY6EI3hNvTwctlgUN326fsRdA3pAusqCU4hUaTmX6w&oe=68004096",
            width: double.infinity,
            height: 350,
            fit: BoxFit.cover,
          ),
          
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 16.0),
            Icon(Icons.favorite, color: Colors.red, size: 16.0),
            const SizedBox(width: 8.0),
            Icon(Icons.thumb_up, color: Colors.blue, size: 16.0),
            const SizedBox(width: 8.0),
            Text("• 143", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _actionButton(Icons.thumb_up_alt_outlined, "Like"),
            _actionButton(Icons.mode_comment_outlined, "Comment"),
            _actionButton(Icons.share_rounded, "Share"),
          ],
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: NetworkImage(
                    "https://scontent.fmnl4-4.fna.fbcdn.net/v/t1.15752-9/483607905_1822002668564821_7125980811533670844_n.jpg?stp=dst-jpg_s2048x2048_tt6&_nc_cat=102&ccb=1-7&_nc_sid=9f807c&_nc_eui2=AeE1dz0zUVnTqicCyW5s7VVe4hJwgD7Kd4_iEnCAPsp3jyhVn6JNO0hDzK-CDDUPifYb49lhkREaMNBQjPmzUcla&_nc_ohc=QHAFwu_T5iUQ7kNvgECppyD&_nc_oc=AdhZOvk6a4n2axnbuRg4V4ME4amc2r_GjdyzZAMvGm1wmRoh54k2z_15J-HO-GA7anYY9Lj7QjHW5EZJZnN2BtKB&_nc_zt=23&_nc_ht=scontent.fmnl4-4.fna&oh=03_Q7cD1wHV16AgxVlIGto4YbxhidgcXGMTVMZoi3mzBxbDdeb6wg&oe=68003964"),
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
        const Divider(),
      ],
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.grey[800]),
      label: Text(label, style: TextStyle(color: Colors.grey[800])),
    );
  }
}
