import 'package:flutter/material.dart';
import 'package:koofit/main_screen/search_tab_menu/add_food_screen.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/model/data/food.dart';
import 'package:koofit/model/data/user.dart';
class FavoriteListItem extends StatefulWidget {
  final Food food;
  final int index;
  final User userData;
  const FavoriteListItem({super.key, required this.food, required this.index, required this.userData});

  @override
  State<FavoriteListItem> createState() => _FavoriteListItemState();
}

class _FavoriteListItemState extends State<FavoriteListItem> {
  late List<Food> _favorites;
  bool isFavorite = true;

  onHeartTap() async {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite == false) {
      widget.userData.favorieFoodList.remove(widget.food);
    } else {
      if (!_favorites.contains(widget.food)) {
        widget.userData.favorieFoodList.add(widget.food);
      } else {
        // Display a snackbar message if the food item already exists in favorites
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('이미 즐겨찾기에 추가되어 있는 음식입니다.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isFavorite,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.black26,
                width: 3,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.food.foodName}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '${(widget.food.calories)}cal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                Row(
                  children: [
                    Text('탄  ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${widget.food.carbo}g'),
                    SizedBox(
                      width: 10,
                    ),
                    Text('단  ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${widget.food.protein}g'),
                    SizedBox(
                      width: 10,
                    ),
                    Text('지  ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${widget.food.fat}g'),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 30,
            child: IconButton(
              onPressed: onHeartTap,
              icon: Icon(
                isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline_rounded,
                color: Color(0xffFFB3BA),
                size: 35,
              ),
            ),
          ),
          Positioned(
            child: AddFoodScreen(food: widget.food),
            top: 55,
            right: 30,
          ),
        ],
      ),
    );
  }
}


class TabFavoriteScreen extends StatefulWidget {
  final User UserData;

  const TabFavoriteScreen({
    super.key,
    required this.UserData,
  });

  @override
  State<TabFavoriteScreen> createState() => _TabFavoriteScreenState();
}

class _TabFavoriteScreenState extends State<TabFavoriteScreen> {
  late List<Food> _favorites;

  @override
  void initState() {
    super.initState();
    _favorites = widget.UserData.favorieFoodList;
  }

  @override
  Widget build(BuildContext context) {
    if (_favorites.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 25),
        child: Text(
          "즐겨찾는 음식을 \n 등록해보세요!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.grey,
          ),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _favorites.length,
          itemBuilder: (context, index) {
            return FavoriteListItem(
              food: _favorites[index],
              index: index,
              userData: widget.UserData,
            );
          },
        ),
      ],
    );
  }
}
