package weatherapp

import app.admin.security.User

import javax.jws.soap.SOAPBinding
import java.time.LocalDateTime

class Location {


    String location
    Date createDate





    static belongsTo = [user: User]

    static constraints = {

        location nullable:  false
        createDate nullable: false


    }
}
