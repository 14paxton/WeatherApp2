package weatherapp
import grails.util.Environment
import app.admin.security.Role
import app.admin.security.User
import app.admin.security.UserRole

import java.time.LocalDate
import java.time.LocalDateTime

class BootStrap {

    def init = { servletContext ->



        //servletContext.cities = City.findAll()



        if (Environment.current == Environment.TEST) {
            populateUsers()
        }


    }





    def populateUsers() {
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(failOnError:true)
        def userRole = new Role(authority: 'ROLE_USER').save(failOnError:true)

        def adminUser = new User(email: "admin@gmail.com", password: "Admin123")
        def userUser = new User(email: "user@gmail.com", password: "User123")

        adminUser.save(failOnError:true)
        userUser.save(failOnError:true)

        UserRole.create adminUser, adminRole
        UserRole.create userUser, userRole

        Date date = new Date()


        def locations = ['lincoln', 'omaha', 'council-tucky', 'kansas city', 'stuart', 'oneil', 'norfolk', 'new york']




        locations.each {

            new Location(user: userUser, location: it, createDate: date).save(failOnError:true)

        }

        //  def  xy =  new Location(user: userUser, location: "lincoln", createDate: date).save(failOnError:true)



        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 2
        assert Role.count() == 2
        assert UserRole.count() == 2
    }




}



/*
package weatherapp

import app.admin.security.Role
import app.admin.security.User
import app.admin.security.UserRole

class BootStrap {

    def init = { servletContext ->
        populateUsers()
    }
    def populateUsers() {
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def operatorRole = new Role(authority: 'ROLE_OPERATOR').save()
        def customerRole = new Role(authority: 'ROLE_CUSTOMER').save()

        def adminUser = new User(username: 'admin', password: 'Password123!', fName: 'doug', lName: 'hans', email: 'dhans1@gmail.com').save()
        def operatorUser = new User(username: 'operator', password: 'Password123!', fName: 'doug', lName: 'hans', email: 'dhans2@gmail.com').save()
        def customerUser = new User(username: 'customer', password: 'Password123!', fName: 'doug', lName: 'hans', email: 'dhans3@gmail.com').save()

        UserRole.create adminUser, adminRole
        UserRole.create operatorUser, operatorRole
        UserRole.create customerUser, customerRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

        assert User.count() == 3
        assert Role.count() == 3
        assert UserRole.count() == 3
    }
}
*/
