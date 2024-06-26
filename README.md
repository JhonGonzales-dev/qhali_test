# Flutter User Management App

This is a sample Flutter application for managing users. It demonstrates the use of GetX for state management and connects to the JSONPlaceholder API for user data.

## Features

- View a list of users
- View details of a specific user
- Add a new user (mock)
- Edit an existing user (mock)
- Delete a user (mock)
- State management using GetX

## Requirements

- Flutter SDK (version 2.5.0 or later)
- Dart SDK (version 2.14.0 or later)

## Getting Started

Follow these instructions to set up and run the project on your local machine.

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/flutter-user-management.git
   cd flutter-user-management
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the application:**

   ```bash
   flutter run
   ```

## Project Structure

```plaintext
lib/
├── main.dart
├── models/
│   └── user.dart
├── services/
│   └── user_service.dart
├── controllers/
│   └── user_controller.dart
├── screens/
│   ├── user_list_screen.dart
│   ├── user_detail_screen.dart
│   ├── add_edit_user_screen.dart
└── widgets/
    └── user_tile.dart
```

- `main.dart`: Entry point of the application.
- `models/`: Contains the `User` model class.
- `services/`: Contains the `UserService` class for making API requests.
- `controllers/`: Contains the `UserController` class for managing state with GetX.
- `screens/`: Contains the UI screens for listing users, viewing user details, and adding/editing users.
- `widgets/`: Contains reusable UI components.

## API Endpoints

The application uses the JSONPlaceholder API for mock data. The following endpoints are used:

- **Get users:** `GET https://jsonplaceholder.typicode.com/users`
- **Add user:** `POST https://jsonplaceholder.typicode.com/users` (mock)
- **Edit user:** `PUT https://jsonplaceholder.typicode.com/users/{id}` (mock)
- **Delete user:** `DELETE https://jsonplaceholder.typicode.com/users/{id}` (mock)

## Usage

### Viewing Users

On the main screen, you will see a list of users fetched from the JSONPlaceholder API. Each user tile displays the user's name and email. Tap on a user to view more details.

### Adding a User

Tap the floating action button (FAB) on the main screen to navigate to the add user screen. Fill in the user details and tap "Save" to add the user. This is a mock operation and will not persist data.

### Editing a User

On the user details screen, tap the "Edit" button to navigate to the edit user screen. Modify the user details and tap "Save" to update the user. This is a mock operation and will not persist data.

### Deleting a User

On the user details screen, tap the "Delete" button to remove the user. This is a mock operation and will not persist data.

## Notes

- The application uses mock operations for adding, editing, and deleting users. These operations will not persist data and are for demonstration purposes only.
- The project uses GetX for state management to provide a responsive and efficient user experience.

## Contributing

Feel free to open issues or submit pull requests if you have any suggestions or improvements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
