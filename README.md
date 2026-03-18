# Posts App – Nerdbug Flutter Assessment

A Flutter application that fetches and displays posts from a public API, allowing users to view post
details and mark posts as favourites.

## Features

- Browse a list of posts fetched from JSONPlaceholder API
- View detailed information for each post
- Like/unlike posts with live feedback
- Loading and error states handled gracefully

## Architecture

The app follows a clean layered architecture:

- **Presentation** – Flutter widgets (`PostsPage`, `PostsDetailPage`, `PostCard`)
- **State Management** – BLoC pattern via `flutter_bloc`
- **Repository** – `PostRepository` abstract class with `ApiPostRepository` implementation
- **Network** – `ApiClient` generic HTTP wrapper handling all requests

## Libraries Used

| Library        | Purpose                        |
|----------------|--------------------------------|
| `flutter_bloc` | State management               |
| `equatable`    | Value equality for bloc states |
| `http`         | HTTP requests                  |

## Setup Instructions

1. **Clone the repository**

```bash
   git clone https://github.com/chibikes/chibuike_nerdbug_assessment.git
   cd chibuike_nerdbug_assessment
```

2. **Install dependencies**

```bash
   flutter pub get
```

3. **Run the app**

```bash
   flutter run
```

> Requires Flutter SDK 3.0 or higher. No API keys needed.

## Project Structure

```
lib/
├── api_client.dart               # Generic HTTP client
├── main.dart                     # App entry point, BLoC initialization
├── models/
│   ├── post.dart                 # Post model with Equatable
│   ├── loading_status.dart       # Loading state enum
├── post_repository/
│   ├── post_repository.dart      # Abstract repository
│   └── api_post_repository.dart  # API implementation
├── view_model/
│   ├── posts_bloc.dart
│   ├── posts_event.dart
│   └── posts_state.dart
└── views/
    ├── pages/
    │   ├── posts_page.dart
    │   └── posts_detail_page.dart
    └── widgets/
        └── post_card.dart
```