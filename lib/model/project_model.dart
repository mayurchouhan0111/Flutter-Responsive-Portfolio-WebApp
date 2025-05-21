class Project {
  final String name;
  final String description;
  final String image;
  final String link;
  Project(this.name, this.description, this.image, this.link);
}

List<Project> projectList = [
  Project(
    'TastyBite - Food Delivery App',
    'A modern food delivery application built with Flutter and Supabase. Features include real-time order tracking, categorized food items, cart management, and seamless payment integration. The app showcases a sleek UI with features like food categories, ratings, and estimated delivery times.',
    'assets/images/tastybite.png',
    'https://github.com/your-repo/tastybite',
  ),
  Project(
    'AI Chatbot',
    'An intelligent chatbot application built with Flutter and Supabase. Features include natural language processing, real-time responses, and a modern user interface for seamless interaction.',
    'assets/images/ai.png',
    'https://github.com/your-repo/ai-chatbot',
  ),
  Project(
    'Daily Task Manager',
    'A comprehensive daily task management application developed with Flutter and Supabase. Includes features for task organization, progress tracking, and real-time synchronization.',
    'assets/images/DayTask.png',  // Updated to match new image name
    'https://github.com/your-repo/daily-task',
  ),
  Project(
    'Real-time Shopping App',
    'A real-time shopping app with a modern, visually appealing UI. Features include seamless online shopping, real-time data updates with Firebase, a stylish product catalog, cart, favorites, and user profile screens.',
    'assets/images/shopping_ui.png',
    'https://github.com/your-repo/shopping-app',
  ),
  Project(
    'Chat Application with Socket.io & Firebase',
    'A modern chat application that supports real-time messaging using Socket.io and Firebase.',
    'assets/images/chat_app.png',
    'https://github.com/your-repo/chat-app',
  ),
  Project(
    'Blog Application',
    'A fully functional blogging platform built with Flutter and Firebase. Users can create, edit, and delete blog posts, upload images, and manage their profiles.',
    'assets/images/blog_app.png',
    'https://github.com/your-repo/blog-app',
  )
];
