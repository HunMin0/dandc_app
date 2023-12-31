import 'package:flutter/material.dart';

class GroupCard extends StatefulWidget {

  final String imagePath;
  final String title;
  final int memberCount;
  final String category;

  const GroupCard({required this.imagePath, required this.category, required this.title, required this.memberCount, Key? key}) : super(key: key);

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    // 즐겨찾기 버튼을 눌럿을때 상태변화
    isFavorite = !isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: 180.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Container(
              width: 180.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: Icon(Icons.person, color: Colors.white, size: 15.0,),
                            ),
                            Text(
                             '${widget.memberCount}명',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3.0),
                              child: Text(
                                '·',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              widget.category,
                              style: TextStyle(
                                color: Color(0xFF6793c8),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 20.0,
                              height: 20.0,
                              child: IconButton(
                                iconSize: 18.0,
                                padding: EdgeInsets.all(0.0),
                                icon: isFavorite
                                    ? Icon(
                                  Icons.favorite,
                                  color: Color(0xFF6793c8),
                                )
                                    : Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    toggleFavorite();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 10.0,
        ),
      ],
    );
  }
}
