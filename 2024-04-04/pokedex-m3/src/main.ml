let index_handler _req =
  let open Lwt.Syntax in
  let* pokemons = Pokemon.fetch () in
  Dream.html (Template_index.render pokemons)

let main_css_handler _req = Dream.respond Asset.main_css

let () =
  Dream.run @@ Dream.logger
  @@ Dream.router
       [ Dream.get "/main.css" main_css_handler; Dream.get "/" index_handler ]
