
package com.ecom.shop.helper;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.http.Part;

public class Fileupload {
    
    public Fileupload(){   
    }
    
    public static void upload(String path, Part part) throws IOException{
        try{
            FileOutputStream fos= new FileOutputStream(path);
            InputStream is= part.getInputStream();
            
            //reading data
            byte[] data= new byte[is.available()];
            is.read(data);
            
            //write data
            fos.write(data);
            fos.close();
            
        }catch(FileNotFoundException e){
            //handling
        }
        
    }
}
