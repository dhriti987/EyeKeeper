from flask import Response
from rest_framework import generics
from school.models import Class, Student, Teacher

from school.serializers import ClassSerializer, StudentSerializer, TeacherSerializer
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth import get_user_model

# Create your views here.


class ClassAPIView(generics.ListCreateAPIView):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]

    serializer_class = ClassSerializer
    queryset = Class.objects.all()


class StudentAPIView(generics.ListCreateAPIView):

    serializer_class = StudentSerializer
    queryset = Student.objects.all()


class TeacherAPIView(generics.ListCreateAPIView):

    serializer_class = TeacherSerializer
    queryset = Teacher.objects.all()

    def post(self, request, *args, **kwargs):
        try:
            new_user = get_user_model().objects.create_user(
                email=request.data['email'], password="abcdefgh")
            request.data['user'] = new_user.pk
        except:
            return Response("User with This Email Already Exist", status=404)
        return super().post(request, *args, **kwargs)
