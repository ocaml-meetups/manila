type type_ = { type_name : string }
type stat = { stat_name : string; base_stat : int }

type t = {
  name : string;
  image_url : string;
  types : type_ list;
  stats : stat list;
}

let fetch_pokemon_list ?(limit = 10) () =
  let open Lwt in
  let open Lwt.Syntax in
  let open Yojson.Basic.Util in
  let uri =
    Uri.of_string
      (Printf.sprintf "https://pokeapi.co/api/v2/pokemon?limit=%d" limit)
  in
  let* _, body = Cohttp_lwt_unix.Client.get uri in
  body |> Cohttp_lwt.Body.to_string >|= Yojson.Basic.from_string >|= fun json ->
  json |> member "results" |> to_list
  |> List.map (fun item -> item |> member "url" |> to_string)

let fetch_pokemon_details url =
  let open Lwt in
  let open Lwt.Syntax in
  let open Yojson.Basic.Util in
  let* _, body = Cohttp_lwt_unix.Client.get (Uri.of_string url) in
  body |> Cohttp_lwt.Body.to_string >|= Yojson.Basic.from_string >|= fun json ->
  {
    name = json |> member "name" |> to_string;
    image_url = json |> member "sprites" |> member "front_default" |> to_string;
    types =
      json |> member "types" |> to_list
      |> List.map (fun t ->
             { type_name = t |> member "type" |> member "name" |> to_string });
    stats =
      json |> member "stats" |> to_list
      |> List.map (fun s ->
             {
               stat_name = s |> member "stat" |> member "name" |> to_string;
               base_stat = s |> member "base_stat" |> to_int;
             });
  }

let fetch_and_parse_pokemon_details urls =
  Lwt_list.map_s fetch_pokemon_details urls

let fetch () =
  let open Lwt.Syntax in
  let* urls = fetch_pokemon_list () in
  fetch_and_parse_pokemon_details urls
