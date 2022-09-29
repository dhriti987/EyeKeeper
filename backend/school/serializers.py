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


class StudentSerialiezer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = "__all__"
