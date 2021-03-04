(*
Author: Justin Henley, CSCI 421_VA_S2021
Date: 2021-03-04
Project Three: Map and fold
*)

(*  Requires: f is a function, either named or anonymous
              the argument after f is a list of size 0 or greater
    Returns:  A list in which every element has been modified by f
    val mymap1 = fn : ('a -> 'b) -> 'a list -> 'b list
 *)
fun mymap1 f = foldr (fn (a,b) => [f a] @ b) [];

(*  Requires: f is a function, either named or anonymous
              the argument after f is a list of size 0 or greater
    Returns:  A list in which every element has been modified by f
    val mymap2 = fn : ('a -> 'b) -> 'a list -> 'b list
 *)
fun mymap2 f list =
      if null list then nil
      else [f (hd list)] @ (mymap2 f (tl list));

(*  Requires: The argument following ordlist is a character list or nil
    Returns: ordlist returns a function to convert the contents of the character
            list to their integer ASCII values.  Returns an int list.

    val ordlist = fn : char list -> int list
*)
val ordlist = map ord;

(*  Requires: list is a list of any type or nil
    Returns: The length of the list

    val mylength = fn : 'a list -> int
*)
fun mylength list = foldl (fn (_,b) => b + 1) 0 list;

(*  Requires: A non-empty integer list
    Returns:  The maximum value of the integer list

    val max = fn : int list -> int
*)
fun max (head::tail) = foldl (fn (a,b) => if (a>b) then a else b) head tail;

(*
SAMPLE RUN

- mymap1 ~ nil;
val it = [] : int list

- mymap1 ~ [1];
val it = [~1] : int list

- mymap1 ~ [1,2,3];
val it = [~1,~2,~3] : int list

- mymap2 ~ nil;
val it = [] : int list

- mymap2 ~ [1];
val it = [~1] : int list

- mymap2 ~ [1,2,3];
val it = [~1,~2,~3] : int list

- ordlist [];
val it = [] : int list

- ordlist [#"A"];
val it = [65] : int list

- ordlist [#"A",#"B",#"C"];
val it = [65,66,67] : int list

- mylength nil;
val it = 0 : int

- mylength [1];
val it = 1 : int

- mylength [1,0];
val it = 2 : int

- mylength [#"a", #"b", #"c"];
val it = 3 : int

- max [1];
val it = 1 : int

- max [0];
val it = 0 : int

- max [8,2,5,9,4,7,1,3];
val it = 9 : int

- max [~3,~5,~2];
val it = ~2 : int

END SAMPLE RUN
*)
