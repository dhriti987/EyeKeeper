from django.db import models
from school.models import Teacher, Student

# Create your models here.

class Attendance(models.Model):
    date = models.DateTimeField(auto_now_add=True)
    student = models.ForeignKey(Student, on_delete=models.CASCADE, related_name='student')
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE, related_name='teacher')
    attendance = models.BooleanField(default=False)
    class Meta:
        unique_together = ('date', 'student')  