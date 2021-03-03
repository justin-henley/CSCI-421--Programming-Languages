(*
Author: Justin Henley, CSCI 421_VA_S2021
Date: 02-27-2021
Project Two: Quicksort
*)

(* Sorts a list of integers. *)
(* int list -> int list *)
fun quickSort (nil) = nil (* Empty case *)
|   quickSort [a] = [a] (* Base case *)
|   quickSort (a::bs) = (* Recursive case *)
      let
          (*
            Uses head of list as pivot
            From the given pivot and list, make a pair of lists (x, y) where:
              all elements <= pivot are in x, and
              all elements > pivot are in y

            int list -> int list * int list
          *)
          fun partition (pivot, nil) = (nil, nil) (* Base case *)
          |   partition (pivot, a::bs) = (* Recursive case *)
                let
                  val (x,y) = partition(pivot, bs) (* Recursive call *)
                in
                  if (a <= pivot) then ([a]@x, y)
                  else (x, [a]@y)
                end;

          val (left, right) = partition(a, bs)
        in
          quickSort(left) @ [a] @ quickSort(right) (* Recursive call *)
        end;

(*
  SAMPLE RUN

  Standard ML of New Jersey v110.79 [built: Sat Oct 26 12:27:04 2019]
  - use "ProjectTwo-JustinHenley.sml";
  [opening ProjectTwo-JustinHenley.sml]
  val quickSort = fn : int list -> int list
  val it = () : unit

  - quickSort nil;
  val it = [] : int list

  - quickSort [1];
  val it = [1] : int list

  - quickSort [~1];
  val it = [~1] : int list

  - quickSort [3,2,1,0,~1];
  val it = [~1,0,1,2,3] : int list

  - quickSort [1,2,1,2,1,2,2,1,1];
  val it = [1,1,1,1,1,2,2,2,2] : int list

  - quickSort [1,9,2,8,3,7,4,5,6];
  val it = [1,2,3,4,5,6,7,8,9] : int list

  - quickSort [1,1,1,1];
  val it = [1,1,1,1] : int list

  - quickSort [3,1,4,8,9,5,7,2,0];
  val it = [0,1,2,3,4,5,7,8,9] : int list

  - quickSort [~1,5,~3,9,11,2];
  val it = [~3,~1,2,5,9,11] : int list
*)
