from django.db import models

from authentication.models import User

# Create your models here.


class Section(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class Class(models.Model):
    name = models.CharField(max_length=50)
    section = models.ForeignKey(
        to=Section, on_delete=models.CASCADE, related_name='section')

    def __str__(self):
        return self.name + " " + self.section.name


def create_path_images(self, filename):
    email = self.email.split('@')[0]
    return f'image/{email}/{filename}'


class Teacher(models.Model):
    id = models.CharField(primary_key=True, max_length=20)
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    contact = models.CharField(max_length=10, unique=True)
    _class = models.ForeignKey(
        to=Class, on_delete=models.CASCADE, related_name='teacher_class')
    designation = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class Student(models.Model):
    id = models.CharField(primary_key=True, max_length=20)
    name = models.CharField(max_length=50)
    email = models.EmailField()
    contact = models.CharField(max_length=10, unique=True)
    _class = models.ForeignKey(
        to=Class, on_delete=models.CASCADE, related_name='student_class')
    photo = models.ImageField(upload_to=create_path_images)
    admission_date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.name
