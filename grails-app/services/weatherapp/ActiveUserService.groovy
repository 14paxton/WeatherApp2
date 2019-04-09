package weatherapp

import grails.gorm.transactions.Transactional
import openweathermap.CurrentWeather
import openweathermap.ForecastWeather
import openweathermap.OpenweathermapService
import openweathermap.Unit

import javax.servlet.ServletContext


@Transactional
class ActiveUserService {

    OpenweathermapService openweathermapService


    def serviceMethod() {

    }



    //method used for getting values for the current weather from
    // the users selected location
    def getCityCode(String locationChoice, def citiesMap )
    {
        def cityChoice = citiesMap.find{key, value -> value[3].equals(locationChoice)}
         cityChoice.value[1]


    }






}
