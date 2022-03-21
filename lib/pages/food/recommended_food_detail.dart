import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: Dimensions.height5,
                  bottom: Dimensions.height10,
                ),
                child: Center(
                  child: BigText(
                    text: 'Chinese Side',
                    size: Dimensions.font26,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/image/food0.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: const ExpandableTextWidget(
                    text:
                        'Biryani là một món cơm trộn có nguồn gốc từ những người Hồi giáo ở tiểu lục địa Ấn Độ. Món ăn này nấu từ gạo (gạo hạt dài và rời) kết hợp với những gia vị đặc trưng của Ấn Độ trộn với thịt thường là thịt gà, thịt dê, thịt cừu, hải sản như tôm, cá, và đôi khi ở một số vùng thì thàn phần gồm trứng hoặc rau củ như khoai tây được thêm vào. Biryani là món ăn phổ biến trên khắp tiểu lục địa Ấn Độ, món này đã trở nên phổ biến ở Nam Ấn Độ, đặc biệt là ở Tamil Nadu, Andhra Pradesh và Telangana, món Biryani này cũng phổ biến ở các khu vực khác như Kurdistan ở Iraq. Từ Biryani là một từ có nguồn gốc từ ngôn ngữ Ba Tư, được sử dụng làm ngôn ngữ chính thức ở các vùng khác nhau của Ấn Độ thời trung cổ dưới các triều đại Hồi giáo. Một giả thuyết cho rằng nó có nguồn gốc từ birinj (برنج) là từ tiếng Ba Tư có nghĩa là gạo. Một giả thuyết khác cho rằng nó có nguồn gốc từ biryan hoặc beriyan (بریان), có nghĩa là "chiên" hoặc "thịt nướng". Biryani là một món cơm trộn có nguồn gốc từ những người Hồi giáo ở tiểu lục địa Ấn Độ. Món ăn này nấu từ gạo (gạo hạt dài và rời) kết hợp với những gia vị đặc trưng của Ấn Độ trộn với thịt thường là thịt gà, thịt dê, thịt cừu, hải sản như tôm, cá, và đôi khi ở một số vùng thì thàn phần gồm trứng hoặc rau củ như khoai tây được thêm vào. Biryani là món ăn phổ biến trên khắp tiểu lục địa Ấn Độ, món này đã trở nên phổ biến ở Nam Ấn Độ, đặc biệt là ở Tamil Nadu, Andhra Pradesh và Telangana, món Biryani này cũng phổ biến ở các khu vực khác như Kurdistan ở Iraq. Từ Biryani là một từ có nguồn gốc từ ngôn ngữ Ba Tư, được sử dụng làm ngôn ngữ chính thức ở các vùng khác nhau của Ấn Độ thời trung cổ dưới các triều đại Hồi giáo. Một giả thuyết cho rằng nó có nguồn gốc từ birinj (برنج) là từ tiếng Ba Tư có nghĩa là gạo. Một giả thuyết khác cho rằng nó có nguồn gốc từ biryan hoặc beriyan (بریان), có nghĩa là "chiên" hoặc "thịt nướng". Biryani là một món cơm trộn có nguồn gốc từ những người Hồi giáo ở tiểu lục địa Ấn Độ. Món ăn này nấu từ gạo (gạo hạt dài và rời) kết hợp với những gia vị đặc trưng của Ấn Độ trộn với thịt thường là thịt gà, thịt dê, thịt cừu, hải sản như tôm, cá, và đôi khi ở một số vùng thì thàn phần gồm trứng hoặc rau củ như khoai tây được thêm vào. Biryani là món ăn phổ biến trên khắp tiểu lục địa Ấn Độ, món này đã trở nên phổ biến ở Nam Ấn Độ, đặc biệt là ở Tamil Nadu, Andhra Pradesh và Telangana, món Biryani này cũng phổ biến ở các khu vực khác như Kurdistan ở Iraq. Từ Biryani là một từ có nguồn gốc từ ngôn ngữ Ba Tư, được sử dụng làm ngôn ngữ chính thức ở các vùng khác nhau của Ấn Độ thời trung cổ dưới các triều đại Hồi giáo. Một giả thuyết cho rằng nó có nguồn gốc từ birinj (برنج) là từ tiếng Ba Tư có nghĩa là gạo. Một giả thuyết khác cho rằng nó có nguồn gốc từ biryan hoặc beriyan (بریان), có nghĩa là "chiên" hoặc "thịt nướng". Biryani là một món cơm trộn có nguồn gốc từ những người Hồi giáo ở tiểu lục địa Ấn Độ. Món ăn này nấu từ gạo (gạo hạt dài và rời) kết hợp với những gia vị đặc trưng của Ấn Độ trộn với thịt thường là thịt gà, thịt dê, thịt cừu, hải sản như tôm, cá, và đôi khi ở một số vùng thì thàn phần gồm trứng hoặc rau củ như khoai tây được thêm vào. Biryani là món ăn phổ biến trên khắp tiểu lục địa Ấn Độ, món này đã trở nên phổ biến ở Nam Ấn Độ, đặc biệt là ở Tamil Nadu, Andhra Pradesh và Telangana, món Biryani này cũng phổ biến ở các khu vực khác như Kurdistan ở Iraq. Từ Biryani là một từ có nguồn gốc từ ngôn ngữ Ba Tư, được sử dụng làm ngôn ngữ chính thức ở các vùng khác nhau của Ấn Độ thời trung cổ dưới các triều đại Hồi giáo. Một giả thuyết cho rằng nó có nguồn gốc từ birinj (برنج) là từ tiếng Ba Tư có nghĩa là gạo. Một giả thuyết khác cho rằng nó có nguồn gốc từ biryan hoặc beriyan (بریان), có nghĩa là "chiên" hoặc "thịt nướng". Biryani là một món cơm trộn có nguồn gốc từ những người Hồi giáo ở tiểu lục địa Ấn Độ. Món ăn này nấu từ gạo (gạo hạt dài và rời) kết hợp với những gia vị đặc trưng của Ấn Độ trộn với thịt thường là thịt gà, thịt dê, thịt cừu, hải sản như tôm, cá, và đôi khi ở một số vùng thì thàn phần gồm trứng hoặc rau củ như khoai tây được thêm vào. Biryani là món ăn phổ biến trên khắp tiểu lục địa Ấn Độ, món này đã trở nên phổ biến ở Nam Ấn Độ, đặc biệt là ở Tamil Nadu, Andhra Pradesh và Telangana, món Biryani này cũng phổ biến ở các khu vực khác như Kurdistan ở Iraq. Từ Biryani là một từ có nguồn gốc từ ngôn ngữ Ba Tư, được sử dụng làm ngôn ngữ chính thức ở các vùng khác nhau của Ấn Độ thời trung cổ dưới các triều đại Hồi giáo. Một giả thuyết cho rằng nó có nguồn gốc từ birinj (برنج) là từ tiếng Ba Tư có nghĩa là gạo. Một giả thuyết khác cho rằng nó có nguồn gốc từ biryan hoặc beriyan (بریان), có nghĩa là "chiên" hoặc "thịt nướng".',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  icon: Icons.remove,
                ),
                BigText(
                  text: '\$12.88 ' + ' X ' + ' 0',
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  iconSize: Dimensions.iconSize24,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  icon: Icons.add,
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: BigText(
                    text: '\$10 | Add to cart',
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
