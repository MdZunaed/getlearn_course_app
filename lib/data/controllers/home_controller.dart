import 'package:get/get.dart';
import 'package:getlearn_app/data/models/course_model.dart';
import 'package:getlearn_app/data/services/network_caller.dart';
import 'package:getlearn_app/data/services/urls.dart';

class HomeController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = "";
  String get errorMessage => _errorMessage;
  CourseModel _courseModel = CourseModel();
  Course? get courseData => _courseModel.course;

  Future<void> getCourseData() async {
    _isLoading = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.courseDetails);
    if (response.isSuccess) {
      _courseModel = CourseModel.fromJson(response.responseData);
    } else {
      _errorMessage = response.errorMessage;
    }
    _isLoading = false;
    update();
  }
}
