from dataclasses import fields
from rest_framework import serializers

from school.models import Class, Student


class ClassSerializer(serializers.ModelSerializer):
    class_name = serializers.SerializerMethodField()

    class Meta:
        model = Class
        fields = ['id', 'class_name']

    def get_class_name(self, obj):
        return obj.name + " " + obj.section.name


class StudentSerializer(serializers.ModelSerializer):

    student_class = serializers.SerializerMethodField()

    class Meta:
        model = Student
        fields = "__all__"

    def get_student_class(self, obj):
        return ClassSerializer(obj._class).data
