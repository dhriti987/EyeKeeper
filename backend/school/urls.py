from django.urls import path

from school.views import ClassAPIView, StudentAPIView

urlpatterns = [
    path('class/', ClassAPIView.as_view()),
    path('student/', StudentAPIView.as_view()),
]
