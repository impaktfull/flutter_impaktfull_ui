import 'dart:math';

import 'package:impaktfull_ui_example/src/examples_library/data/model/coupon.dart';
import 'package:impaktfull_ui_example/src/examples_library/data/model/order.dart';
import 'package:impaktfull_ui_example/src/examples_library/data/model/product.dart';

class TestData {
  static List<Product> getProducts() => [
        "Smartphone",
        "Laptop",
        "Tablet",
        "Smartwatch",
        "Wireless Earbuds",
        "Bluetooth Speaker",
        "4K TV",
        "Gaming Console",
        "Digital Camera",
        "E-reader",
        "Fitness Tracker",
        "Drone",
        "VR Headset",
        "Portable Charger",
        "Wireless Mouse",
        "Mechanical Keyboard",
        "External Hard Drive",
        "Wi-Fi Router",
        "Smart Thermostat",
        "Robot Vacuum",
        "Air Purifier",
        "Coffee Maker",
        "Blender",
        "Toaster Oven",
        "Microwave",
        "Refrigerator",
        "Dishwasher",
        "Washing Machine",
        "Dryer",
        "Air Conditioner",
        "Space Heater",
        "Ceiling Fan",
        "Desk Lamp",
        "Floor Lamp",
        "Smart Light Bulbs",
        "Security Camera",
        "Doorbell Camera",
        "Smart Lock",
        "Smoke Detector",
        "Carbon Monoxide Detector",
        "Fire Extinguisher",
        "First Aid Kit",
        "Tool Set",
        "Drill",
        "Lawn Mower",
        "Pressure Washer",
        "Grill",
        "Patio Furniture Set",
        "Outdoor Umbrella",
        "Tent",
        "Sleeping Bag",
        "Hiking Backpack",
        "Binoculars",
        "Telescope",
        "Bicycle",
        "Electric Scooter",
        "Skateboard",
        "Yoga Mat",
        "Dumbbells",
        "Treadmill",
        "Exercise Bike",
        "Rowing Machine",
        "Elliptical Machine",
        "Weight Bench",
        "Resistance Bands",
        "Jump Rope",
        "Foam Roller",
        "Massage Gun",
        "Guitar",
        "Piano Keyboard",
        "Drum Set",
        "Violin",
        "Ukulele",
        "Microphone",
        "Turntable",
        "Soundbar",
        "Projector",
        "Streaming Device",
        "Gaming Chair",
        "Gaming Mouse",
        "Gaming Headset",
        "Graphics Card",
        "Computer Monitor",
        "Printer",
        "Scanner",
        "Paper Shredder",
        "Office Chair",
        "Standing Desk",
        "Bookshelf",
        "Filing Cabinet",
        "Whiteboard",
        "Projector Screen",
        "Surge Protector",
        "UPS Battery Backup",
        "Network Switch",
        "NAS Device",
        "Dash Cam",
        "Car GPS",
        "Tire Pressure Gauge",
        "Jumper Cables"
      ]
          .map(
            (e) => Product(
              sku: e.toLowerCase(),
              name: e,
              isNewProduct: e.hashCode % 10 == 0,
              price: e.hashCode % 150,
              stock: e.hashCode % 25,
            ),
          )
          .toList();

  static List<Order> getOrders() => List.generate(
        100,
        (index) => Order(
          id: generateUUID(),
          createdAt: DateTime.now().subtract(Duration(days: index)),
          totalPrice: 100,
        ),
      )..sort((a, b) => b.createdAt.compareTo(a.createdAt));

  static List<Coupon> getCoupons() => [
        Coupon(
          tag: 'SUMMER_2024',
          validFrom: DateTime.now().subtract(const Duration(days: 10)),
          validUntil: DateTime.now().add(const Duration(days: 10)),
          totalDiscount: 5,
        ),
        Coupon(
          tag: 'NEW_YEAR_2025',
          validFrom: DateTime(2025, 1, 1),
          validUntil: DateTime(2025, 1, 1, 23, 59, 59),
          totalDiscount: 25,
        ),
      ];

  static String generateUUID() {
    const hexDigits = '0123456789abcdef';
    final Random random = Random();
    final List<String> uuid = List<String>.filled(36, '', growable: false);

    for (int i = 0; i < 36; i++) {
      if (i == 8 || i == 13 || i == 18 || i == 23) {
        uuid[i] = '-';
      } else if (i == 14) {
        uuid[i] = '4';
      } else if (i == 19) {
        uuid[i] = hexDigits[(random.nextInt(4) | 0x8)];
      } else {
        uuid[i] = hexDigits[random.nextInt(16)];
      }
    }

    return uuid.join();
  }

  static String formatDate(DateTime date, {bool withTime = false}) {
    final fullDate =
        '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
    final time =
        ' ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    if (withTime) {
      return '$fullDate$time';
    }
    return fullDate;
  }

  static String formatPrice(double value) {
    return '€${value.toStringAsFixed(2)}';
  }
}
