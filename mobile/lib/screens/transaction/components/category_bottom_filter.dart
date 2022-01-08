import 'package:flutter/material.dart';
import 'package:mobile/model/balance/category.dart';
import 'package:mobile/services/balance/category_rest_service.dart';

class CategoryBottomFilter extends StatefulWidget {
  final Function categoriesFilterCallback;
  final List<int> categoryIds;

  const CategoryBottomFilter(
      {Key? key,
      required this.categoriesFilterCallback,
      required this.categoryIds})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryBottomFilterState();
}

class _CategoryBottomFilterState extends State<CategoryBottomFilter> {
  Map<int, Category> _selectedItems = {};

  @override
  void deactivate() {
    widget.categoriesFilterCallback(
        List.of(_selectedItems.values.map((e) => e.id)));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: size.height * 0.4,
      width: size.width,
      child: FutureBuilder<List<Category>>(
        future: CategoryRestService.getCategories(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.only(top: 8.0),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Category category = snapshot.data![index];
                return ListTile(
                  title: Text(category.value),
                  trailing: _selectedItems.containsKey(index) ||
                          widget.categoryIds.contains(category.id)
                      ? const Icon(
                          Icons.check,
                          color: Colors.black,
                        )
                      : null,
                  onTap: () {
                    if (_selectedItems.containsKey(index)) {
                      setState(() {
                        _selectedItems.removeWhere(
                            (indexMap, category) => indexMap == index);
                      });
                    } else {
                      setState(() {
                        _selectedItems.putIfAbsent(index, () => category);
                      });
                    }
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Container();
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
