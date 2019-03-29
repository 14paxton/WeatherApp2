package weatherapp

import grails.converters.JSON
import grails.util.Environment
import app.admin.security.Role
import app.admin.security.User
import app.admin.security.UserRole
import org.hibernate.criterion.CriteriaSpecification


import java.time.LocalDate
import java.time.LocalDateTime

class BootStrap {

    def init = { servletContext ->


        def cityMap = [:]
        def choiceList = []
/*

        def cityall = City.listOrderByCountry()
*/


        def criteria = City.createCriteria()
        def cityList = criteria.list{

            projections {
                distinct(['cityName', 'country', 'geonameID'])

            }


        }
        
      /*


        cityList.eachWithIndex { Object entry, int i ->

            entry.each {[ cityName: entry[0] ,geoID: entry[2],
                          countryName: entry[1], listChoice: entry[1] + ', ' + entry[0] ]}
        }
*/


      /*  def allCityObjects = []

        cityList.each {allCityObjects.push( City.findWhere(cityName: it[0], geonameID: it[2], country: it[1]))}*/





        /*cityMap = cityList.collect{[ cityName: it[0] ,geoID: it[2],
                                     countryName: it[1], listChoice: it[1].countryName + ', ' + it[0] ] }*/


    /*    cityList.each{  cityMap["${i}"] =[ cityName: it[0],geoID: it[2],
                                   countryName: it[1], listChoice: it[1].countryName + ', ' + it[0] ] }*/


        cityList.eachWithIndex{ list , index -> cityMap[index] =[ list[0] ,list[2],
                                        list[1],  list[1].countryName + ', ' + list[0] ] }



        servletContext.citiesMap = cityMap

        cityList.each { entry -> choiceList << entry[1].countryName + ", " + entry[0]}

        servletContext.choiceList = choiceList







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


