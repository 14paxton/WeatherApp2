package openweathermap

import groovy.transform.CompileStatic

@CompileStatic
class ForecastDay {

    String date
    Date javaDate
    Main main
    List <Weather> weatherList


}
