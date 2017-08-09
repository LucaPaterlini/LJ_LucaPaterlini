import unittest
from weather import weather_forecast

class TestWeather_Forecast(unittest.TestCase):

    def test_London_reponse(self):
        weather_forecast('London')

    def test_Not_valid_City(self):
        self.assertEquals(weather_forecast('5'),{u'message': u'city not found', u'cod': u'404'})


if __name__ == '__main__':
    unittest.main()