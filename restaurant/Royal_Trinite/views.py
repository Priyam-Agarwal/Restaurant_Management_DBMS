from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import redirect, render

from django.contrib.auth.decorators import login_required

from .forms import CreateUserForm
# Create your views here.
from .models import *


def registerPage(request):
    if request.user.is_authenticated:
        return redirect("home")
    else:
        form = CreateUserForm()

        if request.method == "POST":
            form = CreateUserForm(request.POST)
            if form.is_valid():
                form.save()
                user = form.cleaned_data.get("username")
                messages.success(
                    request, "Account was successfully created for " + user)

                return redirect("login")

        context = {"form": form}
        return render(request, "register.html", context)


def loginPage(request):
    if request.user.is_authenticated:
        return redirect("home")
    else:

        if request.method == "POST":
            username = request.POST.get("username")
            password = request.POST.get("password")

            user = authenticate(request, username=username, password=password)

            if user is not None:
                login(request, user)
                return redirect("home")
            else:
                messages.info(request, "Username or Password is incorrect")

        context = {}
        return render(request, "login.html", context)


def logoutUser(request):
    logout(request)
    return redirect("login")


@login_required(login_url="login")
def home(request):
    return render(request, "index.html")
