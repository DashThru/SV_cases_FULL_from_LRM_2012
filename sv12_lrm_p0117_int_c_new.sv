////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        117
// Description: arrays as arguments to subroutines
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0117_int_c_new;


  int A[2][100:1];
  int B[] = new[100]; // dynamic array of 100 elements
  int C[] = new[8];  // dynamic array of 8 elements
  int D [3][][];     // multidimensional array with dynamic subarrays

  initial begin
    D[2] = new [2];    // initialize one of D's dynamic subarrays
    D[2][0] = new [100];
    A[1] = B;  // OK. Both are arrays of 100 ints
    A = D[2];  // A[0:1][100:1] and subarray D[2][0:1][0:99] both comprise 2 subarrays of 100 ints
  end

  int A1[100:1];      // fixed-size array of 100 elements
  int B1[];           // empty dynamic array
  int C1[] = new[8];  // dynamic array of size 8
  
  initial begin
   B1 = A1;             // ok. B has 100 elements
   B1 = C1;             // ok. B has 8 elements
   B1 = new[ C1.size ] (C1);
  end

  
  string d[1:5] = '{ "a", "b", "c", "d", "e" };
  string p[];
  initial p = { d[1:3], "hello", d[4:5] };

  task fun(int a[3:1][3:1]);
  endtask
  
  int b[3:1][3:1];  // OK: same type, dimension, and size
  int c[1:3][0:2];  // OK: same type, dimension, & size (different ranges)

  initial begin
    fun(b);
    fun(c);
  end

  task t( string arr[4:1] );
  endtask
  
  string x[4:1];        // OK: same type and size
  string y[5:2];        // OK: same type and size (different range)
  string z[] = new[4];  // OK: same type, number of dimensions, and dimension size; requires run-time check

  initial begin
    t(x);
    t(y);
    t(z);
  end


  task td ( string arr[] );
  endtask

  initial begin
    td(x);
    td(y);
    td(z);
  end

  
endmodule : sv12_lrm_p0117_int_c_new
