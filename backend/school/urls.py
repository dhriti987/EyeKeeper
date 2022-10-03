from django.urls import path

from school.views import ClassAPIView, StudentAPIView, TeacherAPIView

urlpatterns = [
    path('class/', ClassAPIView.as_view()),
    path('student/', StudentAPIView.as_view()),
    path('teacher/', TeacherAPIView.as_view()),
]
