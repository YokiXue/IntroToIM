
//import text file

void GetTextMain(){ 
    String[] textLines;
    String[] textRow;
    
    textLines = TextInput(textPath);
    textMain = new Object[textLines.length][2]; //initialize the object
    for(int t=0;t<textLines.length;t++){
        if( !(textLines[t].contains("[") && textLines[t].contains("]") && textLines[t].contains(":")) )
        {
            continue;  //check the format
        }
        textRow = textLines[t].split("]");  //split the content of each row by "]"
        textRow[0]=(textRow[0].substring(textRow[0].indexOf("[")+1)); 
        textMain[t][0]= float(textRow[0].split(":")[0])*60 + float(textRow[0].split(":")[1]);
        //time
        textMain[t][1]=textRow[1];  //content
    }
}


String[] TextInput(String tPath){
    String[] textLines = {};  //import text from file
    textLines =  loadStrings(tPath);
    //reads the contents and creates a String array of individual lines
    println("total import " + textLines.length + " lines");
    for (int p = 0 ; p < textLines.length; p++) {
        println(textLines[p]);
    }
    return textLines;
}
