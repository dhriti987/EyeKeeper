from django.db import models
from django.contrib.auth.models import(
    AbstractBaseUser,
    BaseUserManager,
    PermissionsMixin
)

# Create your models here.

class UserManager(BaseUserManager):
    def create_user(self,email,password=None):
        if email is None:
            raise ValueError("User must have email")

        user = self.model(email = self.normalize_email(email))
        user.set_password(password)
        user.save()
        return user

    def create_superuser(self,email,password=None):
        if password is None:
            raise ValueError("Password should not be none")
        user = self.create_user(email,password)
        user.is_superuser = True
        user.is_staff = True
        user.save()
        return user

class User(AbstractBaseUser,PermissionsMixin):
    email = models.EmailField(max_length=255,unique=True)
    is_verified = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)

    USERNAME_FIELD = 'email'

    objects = UserManager()

    def __str__(self):
        return self.email
         