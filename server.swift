#!/usr/bin/env xcrun swift -F Rome 

import Taylor

let server = Taylor.Server()
server.addPostRequestHandler(Middleware.requestLogger(print))

server.get("/") {
    request, response, callback in

    response.bodyString  = "Hello World!"

    callback(.Send(request, response))
}

server.startListening(port: 4000, forever: true) {
    result in
    switch result {
    case .Success:
        print("Up and running")
    case .Error(let e):
        print("Server start failed \(e)")
    }
}
