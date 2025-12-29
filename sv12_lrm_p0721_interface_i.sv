////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        721
// Description: interface modport expressions
// Note:        
//
////////////////////////////////////////////////////////////////

interface I;
  logic [7:0] r;
  const int x=1;
  bit R;
  modport A (output .P(r[3:0]), input .Q(x), R); 
  modport B (output .P(r[7:4]), input .Q(2), R);
endinterface

module M ( interface i); 
  initial i.P = i.Q;
endmodule

module top; 
  I i1 ();
  M u1 (i1.A);
  M u2 (i1.B);
  initial #1 $display("%b", i1.r);  // displays 00100001
endmodule

// Deleted from LRM2023
// Bus interface with parameterized number of client modports 
interface intf_t #(num_clients = 0);
  bit [num_clients-1:0] req;
  modport client_mp (output .client_req( req[0] ));

  for (genvar i=0; i< num_clients; i++) begin: mps 
    //modport client_mp (output .client_req( req[i] ));
  end
endinterface

// A generic client that attaches to the bus 
module client_m (interface client_ifc);
       // ... code will drive client_ifc.client_req
endmodule

// The bus system with N clients 
module bus #(N = 4);
  intf_t #(.num_clients(N)) intf();
  for (genvar j=0; j < N; j++) begin: clients
    client_m client (.client_ifc (intf.client_mp));
  end
endmodule

module sv12_lrm_p0721_interface_i;
  top top();
  bus bus();
endmodule : sv12_lrm_p0721_interface_i
