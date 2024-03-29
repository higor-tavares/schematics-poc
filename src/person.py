from schematics.models import Model
from schematics.types import StringType, URLType
from schematics.exceptions import DataError
import json

class Person(Model):
    name = StringType(required=True)
    website = URLType()