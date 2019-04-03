package weatherapp

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }


        "/"(controller: "Default" , action: "index")
        "/index"(controller: "Default" , action: "index")
        "500"(controller: "Errors", action: "index")
        "503"(controller: "Errors", action: "index")
        "404"(view:'/notFound')
    }
}
