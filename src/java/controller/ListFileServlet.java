package controller;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListFileServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //path of the directory to save uploaded file
        String uploadFilePath = "\\\\silva.computing.dundee.ac.uk\\webapps\\2018-agileteam1\\pdf";
        
        //create string hash map
        Map<String,String> fileNameMap = new HashMap<String,String>();
        
        //update hash map with files
        listfile(new File(uploadFilePath),fileNameMap);//File can be either a file or a menu
        
        //set hash map as implicit variable for listfile.jsp to show
        request.setAttribute("fileNameMap", fileNameMap);
        request.getRequestDispatcher("/listfile.jsp").forward(request, response);
    }
    
    /* 
     * recursively add all files from specified downwards to hash map
     */
    public void listfile(File file,Map<String,String> map){
        //if folder
        if(!file.isFile()){
            //get all files in folder
            File files[] = file.listFiles();
            
            //for each file in folder
            for(File f : files){
                //recursive
                listfile(f,map);
            }
        }else{
            //add to hash map
            String realName = file.getName().substring(file.getName().indexOf("_")+1);
            map.put(file.getName(), realName);
        }
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}