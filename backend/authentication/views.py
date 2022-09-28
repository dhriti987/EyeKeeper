from rest_framework.response import Response
from rest_framework import generics, status
from . serializers import UserSerializer
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token

# Create your views here.


# class RegisterView(generics.GenericAPIView):

#     serializer_class = UserSerializer

#     def post(self, request):
#         serializer_obj = self.serializer_class(data=request.data)
#         serializer_obj.is_valid(raise_exception=True)
#         serializer_obj.save()
#         user_data = serializer_obj.data

#         return Response(user_data, status=status.HTTP_201_CREATED)


class CustomAuthToken(ObtainAuthToken):

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        token, created = Token.objects.get_or_create(user=user)
        return Response({
            'token': token.key,
            'user_id': user.pk,
            'name': user.teacher.name,
            'class': user.teacher._class.pk,
        })
