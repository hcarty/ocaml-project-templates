(** {1 Mylib}

    Pretty much the best library ever. *)

type t
(** We're hiding the raw representation of this type because we can't be
    trusted with the truth *)

val make : user:string -> domain:string -> t
(** [make ~user ~domain] creates a {!t} from the given [user] and [domain]
    components. *)

val of_string : string -> (t, [> `Msg of string]) result
(** [of_string s] attempts to parse an email-ish {!t} value from [s]. *)

val to_string : t -> string
(** [to_string t] returns a human-friendly string representation of [t]. *)

val pp : t Fmt.t
(** Pretty-printer for {!t} values *)

val equal : t -> t -> bool
(** Equality check for {!t} values *)
