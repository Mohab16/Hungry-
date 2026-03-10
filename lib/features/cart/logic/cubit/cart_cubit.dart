import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/cart/data/models/order_item_model.dart';
import 'package:hungry/features/cart/logic/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));
  List<int> selectedToppings = [];
  List<int> selectedSideOptions = [];
  double spicyLevel = 0.5;
  int productId = -50;
  int quantity = 1;
  bool isExpanded = false;

  void addProduct(OrderItem item) {
    final items = List<OrderItem>.from(state.items);

    final index = items.indexWhere((item) => item.productId == productId);

    isExpanded = true;

    if (index != -1) {
      items[index].quantity = (items[index].quantity ?? 0) + 1;
    } else {
      items.add(item);
    }
    calcTotalPrice();

    emit(CartState(items));
    clearSelection();

    //     for (final item in state.items) {
    //   print(
    //     'productId: ${item.productId}, '
    //     'quantity: ${item.quantity}, '
    //     'spicy: ${item.spicy}, '
    //     'toppings: ${item.toppings}, '
    //     'sideOptions: ${item.sideOptions}',
    //   );
    // }
  }

  void changeSelectedToppings(int topping) {
    if (!selectedToppings.contains(topping)) {
      selectedToppings.add(topping);
    } else {
      selectedToppings.remove(topping);
    }
    emit(state);
  }

  void changeSelectedSideOptions(int sideOption) {
    if (!selectedSideOptions.contains(sideOption)) {
      selectedSideOptions.add(sideOption);
    } else {
      selectedSideOptions.remove(sideOption);
    }
    emit(state);
  }

  void changeSpicyLevel(double level) {
    spicyLevel = level;
    emit(CartState(state.items, spicyLevel: level));
  }

  void increaseItemQuantity(OrderItem item) {
    final index = state.items.indexWhere(
      (element) => element.productId == item.productId,
    );

    if (index < 0 || index >= state.items.length) return;

    state.items[index].quantity = (state.items[index].quantity ?? 0) + 1;
    emit(CartState(state.items));
    calcTotalPrice();
  }

  void decreaseItemQuantity(OrderItem item) {
    final index = state.items.indexWhere(
      (element) => element.productId == item.productId,
    );
    if (index < 0 || index >= state.items.length) return;

    final newQty = (state.items[index].quantity ?? 0) - 1;

    if (newQty <= 0) {
      state.items.removeAt(index);
    } else {
      state.items[index].quantity = newQty;
    }

    emit(CartState(state.items));
    calcTotalPrice();
  }

  void removeItem(int index) {
    final items = state.items;
    items.removeAt(index);
    emit(CartState(items));
    calcTotalPrice();
  }

  void calcTotalPrice() {
    double total = 0;
    for (var item in state.items) {
      final price = item.price ?? 0;
      total += (item.quantity ?? 0) * price;
    }

    emit(
      CartState(
        List.from(state.items), // نسخ الـ items عشان Immutable
        totalPrice: total,
      ),
    );
  }

  void clearSelection() {
    selectedToppings = [];
    selectedSideOptions = [];
    spicyLevel = 0.5;
    productId = -50;
  }

  void emptyCart() {
    emit(CartState([]));
    clearSelection();
  }
}
