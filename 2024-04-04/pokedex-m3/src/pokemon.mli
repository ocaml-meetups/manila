type type_ = { type_name : string }
type stat = { stat_name : string; base_stat : int }

type t = {
  name : string;
  image_url : string;
  types : type_ list;
  stats : stat list;
}

val fetch : unit -> t list Lwt.t
