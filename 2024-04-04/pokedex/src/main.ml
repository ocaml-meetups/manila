let handler _req = Dream.html "Hello World"
let () = Dream.run @@ Dream.logger @@ Dream.router [ Dream.get "/" handler ]
