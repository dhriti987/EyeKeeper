from rest_framework import generics
from school.models import Class, Student, Teacher

from school.serializers import ClassSerializer, StudentSerializer, TeacherSerializer
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated

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
