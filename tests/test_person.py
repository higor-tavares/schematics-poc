import pytest
from person import Person
from schematics.exceptions import DataError

def test_person():
    expected_name = "Higor"
    expected_url = "https://higortavares.github.io"
    person = Person({"name": expected_name, "website": expected_url})
    person.validate()
    assert(person.name) == expected_name
    assert(person.website) == expected_url

def test_person_should_raise_error_whitout_name():
    expected_url = "https://higortavares.github.io"
    person = Person({"website": expected_url})
    with pytest.raises(DataError):
        person.validate()
    assert(person.website) == expected_url