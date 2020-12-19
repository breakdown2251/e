String filename;
boolean fileselected;
boolean END = false;

void fileSelect(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    fileselected = false;
  } 
  else {
    filename = selection.getAbsolutePath();
    okunan = loadStrings(filename);
    okunan = append(okunan,"(end_me)");
    fileselected = true;
  }
}

void end_check(String a){
  if(a=="(end_me)"){
    END = true;
    noLoop();}}
  
