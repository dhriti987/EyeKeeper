from django.db import models
from school.models import Teacher, Student

# Create your models here.

class Attendance(models.Model):
    id = models.IntegerField(unique=True)
    date = models.DateTimeField(auto_now_add=True)
    student = models.ForeignKey(Student, on_delete=models.CASCADE, related_name='student')
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE, related_name='teacher')

    def __str__(self):
        return self.date
        