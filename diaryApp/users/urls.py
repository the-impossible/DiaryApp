from django.urls import path

# MyApp
from users.views import (
    RegisterView,
    UserView,
)


app_name = "users"

urlpatterns = [
    path("register/", RegisterView.as_view(), name="register"),
    path("user/", UserView.as_view(), name="user"),
]
