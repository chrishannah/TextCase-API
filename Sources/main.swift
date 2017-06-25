import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()
server.serverPort = 8080

var routes = Routes()
routes.add(method: .get, uri: "/", handler: {
	request, response in
	response.setBody(string: "Hello, Perfect!")
		.completed()
})

server.addRoutes(routes)

do {
	try server.start()
} catch PerfectError.networkError(let error, let message) {
	print("Network error: ")
	print("    \(error)")
	print("    \(message)")
}
