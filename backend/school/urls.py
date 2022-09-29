from django.urls import path

from school.views import ClassAPIView

urlpatterns = [
    path('class/', ClassAPIView.as_view()),
]
