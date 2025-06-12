import 'package:get/get.dart';
import '../../../model/project_model.dart'; // Make sure this path is correct

class ProjectsController extends GetxController {
  RxList<Project> projects = <Project>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadProjects();
  }

  void loadProjects() async {
    isLoading(true);

    // Simulate loading delay (remove this in production)
    await Future.delayed(const Duration(seconds: 1));

    // Load your static list here — you can replace this later with API/Supabase call
    projects.value = projectList;

    isLoading(false);
  }
}
