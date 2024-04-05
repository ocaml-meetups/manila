let fetch_pokemon_names () =
  let open Lwt.Syntax in
  let uri = Uri.of_string "https://pokeapi.co/api/v2/pokemon?limit=151" in
  let* resp, body = Cohttp_lwt_unix.Client.get uri in
  let* body = Cohttp_lwt.Body.to_string body in
  match Cohttp.Response.status resp with
  | `OK -> (
      match Yojson.Basic.from_string body with
      | `Assoc items -> (
          match List.assoc "results" items with
          | `List names ->
              Lwt.return
                (List.map
                   (fun name ->
                     match name with
                     | `Assoc name_item -> (
                         match List.assoc "name" name_item with
                         | `String s -> s
                         | _ -> "")
                     | _ -> "")
                   names)
          | _ -> Lwt.return [])
      | _ -> Lwt.return [])
  | _ -> Lwt.return []

let index_handler _req =
  let open Lwt.Syntax in
  let* names = fetch_pokemon_names () in
  let names_html = String.concat "<br>" names in
  Dream.html (Printf.sprintf "<h1>Pokémon Names</h1><p>%s</p>" names_html)

let () =
  Dream.run @@ Dream.logger @@ Dream.router [ Dream.get "/" index_handler ]
