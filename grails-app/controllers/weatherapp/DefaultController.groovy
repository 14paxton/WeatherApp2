package weatherapp

import org.springframework.web.servlet.support.RequestContextUtils

class DefaultController {

    def index() {


        def lang = RequestContextUtils.getLocale(request).toString()

                [lang: lang]


    }
}
