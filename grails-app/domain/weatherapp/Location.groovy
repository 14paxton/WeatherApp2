package weatherapp

import app.admin.security.User


import javax.jws.soap.SOAPBinding
import java.time.LocalDateTime



class Location {

    String currentWeatherCall
    String fiveDayWeatherCall



    static belongsTo = [user: User, city: City]

    static constraints = {




    }

    static mapping = {


        cache: true
        user lazy: false
        city lazy: false


    }



}
