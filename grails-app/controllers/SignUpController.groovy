

import grails.events.EventPublisher
import grails.gorm.transactions.Transactional
import org.springframework.security.access.annotation.Secured
import app.admin.security.*

@Secured('permitAll')
class SignUpController implements EventPublisher {



    // tag::join[]
    def join() { } // <1>
    // end::join[]

    // tag::save[]
    @Transactional
    def save(SignUpCommand cmd) {
        if(!cmd.validate()) { // <1>
            flash.errors = cmd.errors
            redirect(action: 'join')
            return
        }

        def user = new User(email: cmd.email, password: cmd.password)
        user.save(failOnError:true)

       // bindData(author, cmd.author, ['user']) // <4>


        UserRole.create(user, Role.findByAuthority('ROLE_USER'))


        flash.message = "Login with your email and password to continue."
        redirect(controller: 'login')
    }
    // end::save[]
}

// tag::command[]
class SignUpCommand {
    String email
    String password


    static constraints = {
        email email: true
    }
}
// end::command[]
