{ Unit that declares the basic text line data type used in a
  number of other packages
  W P Cockshott
}
unit lines;
interface
const linelen=80;
type textline= string [linelen];
     pcharseq=^textline;
implementation
end.