class Project {
  final String name;
  final String description;
  final String image;
  final String link;
  Project(this.name, this.description, this.image, this.link);
}

List<Project> projectList = [
  Project(
    'Real-time Shopping App',
    'A real-time shopping app that provides users with a seamless online shopping experience. It features Firebase integration for real-time data updates, a shopping cart, and secure authentication.',
    'assets/images/shopping.png',
    'https://github.com/your-repo/shopping-app',
  ),
  Project(
    'Chat Application with Socket.io & Firebase',
    'A modern chat application that supports real-time messaging using Socket.io and Firebase. The app features chat rooms, private messaging, and Firebase Authentication.',
    'assets/images/chat.png',
    'https://github.com/your-repo/chat-app',
  ),
  Project(
    'Blog Application',
    'A fully functional blogging platform built with Flutter and Firebase. Users can create, edit, and delete blog posts, upload images, and manage their profiles.',
    'assets/images/blog.png',
    'https://github.com/your-repo/blog-app',
  ),
  Project(
    'To-Do App',
    'A task management application built with Flutter that allows users to add, update, and delete tasks efficiently. Features include task notifications and a sleek UI.',
    'assets/images/todo.png',
    'https://github.com/your-repo/todo-app',
  ),
  Project(
    'UI-Based App Collection',
    'A collection of beautiful UI designs created using Flutter. This includes different screen layouts, animations, and component designs for inspiration.',
    'assets/images/ui.png',
    'https://github.com/your-repo/ui-apps',
  ),
  Project(
    'Hospital Management App',
    'An app designed for hospital management, including features like OPD queuing models, patient admissions, and bed availability tracking, all powered by Firebase.',
    'assets/images/hospital.png',
    'https://github.com/your-repo/hospital-app',
  ),
  Project(
    'Weather App',
    'A weather forecasting app built with Flutter, integrating APIs to provide real-time weather updates for different locations.',
    'assets/images/weather.png',
    'https://github.com/your-repo/weather-app',
  ),
  Project(
    'Wallpaper App',
    'A wallpaper application featuring GridView and network-based image fetching using the Dio package for API calls.',
    'assets/images/wallpaper.png',
    'https://github.com/your-repo/wallpaper-app',
  ),
  Project(
    'Checkout & Payment System',
    'A complete checkout and payment management system in Flutter, featuring SQLite for address storage and JSON-based payment options.',
    'assets/images/checkout.png',
    'https://github.com/your-repo/checkout-system',
  ),
];

