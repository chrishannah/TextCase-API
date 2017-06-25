import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()
server.serverPort = 8080

func returnJSONKeyValue(key: String, value: String, response: HTTPResponse) {
	do {
		try response.setBody(json: [key : value])
			.setHeader(.contentType, value: "application/json")
			.completed()
	} catch {
		response.setBody(string: "Error handling request: \(error)")
			.completed(status: .internalServerError)
	}
}

var routes = Routes()
routes.add(method: .get, uri: "/title/{input}", handler: {
	request, response in
	
	guard let inputString = request.urlVariables["input"] else {
		response.completed(status: .badRequest)
		return
	}
	
	let textCase = TextCase()
	
	let title = textCase.titleCase(input: inputString)
	
	returnJSONKeyValue(key: "title", value: title, response: response)
	
})

server.addRoutes(routes)

do {
	try server.start()
} catch PerfectError.networkError(let error, let message) {
	print("Network error: ")
	print("    \(error)")
	print("    \(message)")
}


