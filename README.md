# 🍔 Hungry

A modern **Flutter food ordering app** featuring user authentication, a browsable food catalog, cart management, checkout, and order tracking — built with clean architecture principles.

---

## 📱 Features

- **Authentication** — Sign up, log in, and email verification flow
- **Onboarding** — Smooth first-launch experience
- **Home / Catalog** — Browse food items with paginated lists and cached images
- **Cart** — Add/remove items, manage quantities
- **Checkout** — Place orders with a streamlined checkout flow
- **My Orders** — View order history and statuses
- **Localization** — Multi-language support via `easy_localization`
- **Responsive UI** — Pixel-perfect on all screen sizes with `flutter_screenutil`

---

## 🏗️ Architecture

The project follows a **feature-first clean architecture**:

```
lib/
├── core/
│   ├── di/          # Dependency injection (GetIt)
│   ├── networking/  # Dio + Retrofit API client
│   ├── routing/     # Named route navigation
│   ├── storage/     # Shared preferences
│   ├── themes/      # App-wide theming
│   ├── helpers/     # Utilities & regex helpers
│   └── widgets/     # Shared reusable widgets
└── features/
    ├── auth_gate/   # Auth state gating
    ├── login/       # Login screen & cubit
    ├── signup/      # Sign-up screen & cubit
    ├── onboarding/  # Onboarding flow
    ├── home/        # Food catalog & discovery
    ├── cart/        # Cart management
    ├── checkout/    # Checkout flow
    └── my_orders/   # Order history
```

**State management:** Flutter BLoC / Cubit  
**Dependency injection:** GetIt  
**Networking:** Dio + Retrofit  
**Code generation:** Freezed, JsonSerializable

---

## 🚀 Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) SDK `^3.8.1`
- Dart SDK `^3.8.1`
- A connected device or emulator

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/Mohab16/Hungry-.git
cd Hungry-

# 2. Install dependencies
flutter pub get

# 3. Run code generation (Freezed, Retrofit, JSON)
dart run build_runner build --delete-conflicting-outputs

# 4. Run the app
flutter run
```

---

## 📦 Key Dependencies

| Package | Purpose |
|---|---|
| `flutter_bloc` | State management |
| `get_it` | Dependency injection |
| `dio` + `retrofit` | HTTP client & API layer |
| `freezed` + `json_serializable` | Immutable models & JSON |
| `firebase_core` | Firebase integration |
| `easy_localization` | Internationalization |
| `flutter_screenutil` | Responsive layouts |
| `cached_network_image` | Efficient image loading |
| `shared_preferences` | Local storage |
| `flutter_svg` | SVG asset rendering |
| `skeletonizer` | Loading skeleton UI |
| `image_picker` | Camera / gallery access |

---

## 🎨 Assets & Fonts

- **Fonts:** Poppins, Roboto, LuckiestGuy, ReemKufiInk
- **Icons:** Custom SVGs + app icon
- **Splash screen:** Custom branded splash via `flutter_native_splash`

---

## 📄 License

This project is for educational/portfolio purposes.