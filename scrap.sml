(* test values and functions *)
val testResults =
      let
          val t1 = nil;
          val a1 = nil;

          val t2 = [1];
          val a2 = [1];

          val t3 = [~1];
          val a3 = [~1];

          val t4 = [3,2,1];
          val a4 = [1,2,3];

          val t5 = [1,2,1,2,1,1,2,2,1,2,1];
          val a5 = [1,1,1,1,1,1,2,2,2,2,2];

          val t6 = [1,9,2,8,3,7,4,5,6];
          val a6 = [1,2,3,4,5,6,7,8,9];

          val t7 = [1,1,1,1];
          val a7 = [1,1,1,1];

          val tests = [t1,t2,t3,t4,t5,t6,t7];
          val answers = [a1,a2,a3,a4,a5,a6,a7];

          fun testQuickSort (a, b) = ( (quickSort a) = b);

          fun test ([a], [b]) = [testQuickSort(a, b)]
          |   test (a::x, b::y) =
                [testQuickSort(a, b)] @ test(x,y);
        in
          test(tests, answers)
        end;
