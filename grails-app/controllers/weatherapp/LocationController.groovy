package weatherapp

import grails.validation.ValidationException
import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class LocationController {

    LocationService locationService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Long id) {
        Location location = Location.findById(id)

        respond(location: location)

    }

    def show(Long id) {
        respond locationService.get(id)
    }

    def create() {
        respond new Location(params)
    }

    def save(Location location) {

        def y = City.findByCityName(location.city.cityName)

        if (location == null) {
            notFound()
            return
        }

        try {
            locationService.save(location)
        } catch (ValidationException e) {
            respond location.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'location.label', default: 'Location'), y.cityName])
                redirect(controller: "ActiveUser")
            }
            '*' { respond location, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond locationService.get(id)
    }

    def update(Location location) {
        if (location == null) {
            notFound()
            return
        }

        try {
            locationService.save(location)
        } catch (ValidationException e) {
            respond location.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'location.label', default: 'Location'), location.id])
                redirect location
            }
            '*'{ respond location, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        def theLocation = Location.findById(id)
        def theCity = City.findByCityName(theLocation.city.cityName)

        locationService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'location.label', default: 'Location'), theCity.cityName])
                redirect(controller: "ActiveUser")
                /*flash.message = message(code: 'default.deleted.message', args: [message(code: 'location.label', default: 'Location'), id])
                redirect action:"index", method:"GET"*/
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
