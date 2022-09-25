from django.db import models

# Create your models here.

def create_path_images(self,filename):
    email = self.email.split('@')[0]
    return f'image/{email}/{filename}'

class Teacher(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    email = models.EmailField(unique=True)
    contact_no = models.CharField(max_length=10,unique=True)

    def __str__(self):
        return self.name

class Section(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name
    
class Class(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    section = models.ForeignKey(to=Section,on_delete=models.CASCADE,related_name='section')

    def __str__(self):
        return self.name
    
class Student(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    parent_email = models.EmailField()
    parent_no = models.CharField(max_length=10, unique=True)
    student_class = models.ForeignKey(to=Class, on_delete=models.CASCADE,related_name='student_class')
    photo = models.ImageField(upload_to=create_path_images)

    def __str__(self):
        return self.name
