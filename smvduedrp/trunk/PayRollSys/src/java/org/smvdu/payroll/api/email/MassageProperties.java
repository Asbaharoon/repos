/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.smvdu.payroll.api.email;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import javax.faces.context.FacesContext;
import org.smvdu.payroll.beans.db.CommonDB;

/**
**
*  Copyright (c) 2010 - 2011 SMVDU, Katra.
*  Copyright (c) 2016 ETRG, IITK
*  All Rights Reserved.
**  Redistribution and use in source and binary forms, with or 
*  without modification, are permitted provided that the following 
*  conditions are met: 
**  Redistributions of source code must retain the above copyright 
*  notice, this  list of conditions and the following disclaimer. 
* 
*  Redistribution in binary form must reproduce the above copyright
*  notice, this list of conditions and the following disclaimer in 
*  the documentation and/or other materials provided with the 
*  distribution. 
* 
* 
*  THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED 
*  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
*  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
*  DISCLAIMED.  IN NO EVENT SHALL SMVDU OR ITS CONTRIBUTORS BE LIABLE 
*  FOR ANY DIRECT, INDIRECT, INCIDENTAL,SPECIAL, EXEMPLARY, OR 
*  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
*  OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
*  BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
*  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
*  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
*  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
* 
* @author Om Prakash <omprakashkgp@gmail.com> IITK
*/


public class MassageProperties {
    
 
 public MassageProperties() {
    }

 /*
 This mathad is use for get properties massages 
 */
        
public String getPropertieValue(String strin)
{
  // System.out.println("==============>I am here");
    Properties prop = new Properties();
    try{
            FacesContext facesContext = FacesContext.getCurrentInstance();
            String path = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/");
            //System.out.print("I am here1=====>"+path+);
            File f = new File(path+"Propertie/Mailmassage.properties");
            FileInputStream fileName = new FileInputStream(f);
            prop.load(fileName);
            fileName.close();
            //System.out.println("regmsq 11========>"+prop.getProperty(strin));
        }
        catch(IOException e)
        {
            e.getStackTrace();
        }
        return prop.getProperty(strin);
}

/*
    This mathod is used for get User Name from database
*/

public String getUserName(String fpmail){
         try{
                Connection connection = new CommonDB().getConnection();
                PreparedStatement pst;
                ResultSet rst;
                pst = connection.prepareStatement("select emp_name from employee_master where emp_email='"+fpmail+"'");
                rst = pst.executeQuery();
                rst.next();
                String uname = rst.getString(1);
                return uname;
                      
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }

}

}
