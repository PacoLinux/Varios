This directory has an example of how you use vector pascal
to construct dlls.

The example dll is in example dll.pas

The c program that uses it is in usesdll

The program must first call dllinit to initialise the pascal run time
library in the dll.

You must also prepare a .def file ( exampledll.def ) in this
case which lists the exported functions of the dll

A sample make file is shown to build the whole system
