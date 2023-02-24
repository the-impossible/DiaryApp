from rest_framework import generics
from rest_framework import status
from rest_framework.response import Response
from rest_framework import permissions

# MyApp Import
from users.serializers import (
    UserSerializer,
)


# Create your views here.
class RegisterView(generics.CreateAPIView):

    """This View create an account for the user"""
    serializer_class = UserSerializer
    permission_classes = [permissions.AllowAny]

    def create(self, request, *args, **kwargs):
        """Creates a user"""
        super().create(request, *args, **kwargs)
        return Response(status=status.HTTP_201_CREATED)


class UserView(generics.RetrieveAPIView):
    """This view returns a user"""
    serializer_class = UserSerializer
    permission_classes = (permissions.IsAuthenticated,)

    def get_object(self):
        return self.request.user
