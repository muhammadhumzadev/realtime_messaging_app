from django.contrib.auth.models import User
from django.test import TestCase, Client
from django.urls import reverse
import unittest
# from core.models import Message
from room.models import Room,Message

client = Client()
user = User.objects.create_user(username='mp73', password='12345mp7xc')
login = client.login(username='mp72', password='12345mp7xc')
