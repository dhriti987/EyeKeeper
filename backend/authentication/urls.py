from django.urls import path
from .views import CustomAuthToken

urlpatterns = [
    # path('register/', RegisterView.as_view(), name='register'),
    path('token/', CustomAuthToken.as_view()),
]
