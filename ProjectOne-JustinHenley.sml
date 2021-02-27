(* val cube = fn : int -> int
Returns:  The cube of the parameter *)
fun cube x = x*x*x;

(* val sqsum = fn : int -> int
Returns: The sum of the squares of all integers from  0 through n
Precondition: n is non-negative *)
fun sqsum n =
  if n <= 0 then 0                   (*Base case*)
  else n * n + sqsum(n - 1);        (*Recursive case*)

(* val max = fn : int list -> list
Returns the largest element of a list of integers.
Precondition: l is not an empty list *)
fun max l =
  if null l then 0
  else
    if (hd l) > (max (tl l)) orelse null (tl l)    (*Recursive case*)
      then (hd l)                   (*Head of list l is larger than any successive element*)
      else (max (tl l));            (*Largest element is in the rest of the list*)


(*
SAMPLE RUN

val cube = fn : int -> int
val sqsum = fn : int -> int
val max = fn : int list -> int
val it = () : unit
- cube 2;
val it = 8 : int
- cube 5;
val it = 125 : int
- cube 10;
val it = 1000 : int


- sqsum 3;
val it = 14 : int
- sqsum 5;
val it = 55 : int
- sqsum 10;
val it = 385 : int
- sqsum ~1;
val it = 0 : int

- max [1,2,3,4,5,4,3,2,1];
val it = 5 : int
- max [1,2,1,1,1,2,1,1];
val it = 2 : int
- max[1];
val it = 1 : int
- max [];
val it = 0 : int
- max [~1];
val it = ~1 : int
- max [~5,~4,~3,~2];
val it = ~2 : int

END SAMPLE RUN
*)
