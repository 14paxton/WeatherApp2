package openweathermap

import groovy.transform.CompileStatic

@CompileStatic
class ForecastDay {

    String date
    Main main
    List <Weather> weatherList


}
