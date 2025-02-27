/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.smvdu.payroll.beans.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.faces.context.FacesContext;
import org.hibernate.Query;

import org.hibernate.Session;
import org.smvdu.payroll.Hibernate.HibernateUtil;
import org.smvdu.payroll.beans.UserInfo;
import org.smvdu.payroll.beans.setup.EmployeeType;

/**
 *
 *  *  Copyright (c) 2010 - 2011 SMVDU, Katra.
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
* 
*  Contributors: Members of ERP Team @ SMVDU, Katra
*
 */



public class EmployeeTypeDB {                 // ADDED ORG CODE IN ALL QUERIES;


    private PreparedStatement ps;
    private ResultSet rs;
    private HibernateUtil helper;
    private Session session;

    private UserInfo userBean;

    public EmployeeTypeDB()
    {
        userBean = (UserInfo) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("UserBean");
    }


    public Exception update(ArrayList<EmployeeType> grades)   {
        try
        {
    
            session = helper.getSessionFactory().openSession();
           
            for(EmployeeType sg : grades)
            { 
                session.beginTransaction();
                
                EmployeeType emp = (EmployeeType)session.get(EmployeeType.class, sg.getCode());
                
                emp.setEmpTypeCode(sg.getEmpTypeCode().toUpperCase());
                emp.setName(sg.getName().toUpperCase());
                emp.setNickname(sg.getNickname().toUpperCase());
                emp.setPfApplies(sg.isPfApplies());
                emp.setMaxpf(sg.getMaxpf());
                emp.setOrgcode(userBean.getUserOrgCode());
                
                session.update(emp);
                session.getTransaction().commit();
            }
            return null;         
        }
        catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
            return e;
        }
        finally {
            session.close();
        }
            
            /*      Connection c = new CommonDB().getConnection();
            ps=c.prepareStatement("update employee_type_master set emp_tcode=?, emp_type_name=?, emp_type_nickname=?"
                    + ",emp_pf_applies=?, emp_maxpf_applies=? where emp_type_id=? and emp_org_id = ?");
            for(EmployeeType sg : grades)
            {
                ps.setString(1, sg.getEmpTypeCode());
                //if(!sg.getName().equals(""))
                ps.setString(2, sg.getName().toUpperCase());
                ps.setString(3, sg.getNickname().toUpperCase());
                ps.setBoolean(4, sg.isPfApplies());
                ps.setInt(5, sg.getMaxpf());
                ps.setInt(6, sg.getCode());
                ps.setInt(7, userBean.getUserOrgCode());             // ADDED ORG CODE;
                ps.executeUpdate();
                ps.clearParameters();
            }
            ps.close();
            c.close();          
        return null;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return e;
        }       */
    }
    
    public ArrayList<EmployeeType> loadTypes()   {
        try
        {
            session = helper.getSessionFactory().openSession();
            
            session.beginTransaction();
            
            Query query = session.createQuery("from EmployeeType where orgcode = '"+userBean.getUserOrgCode()+"'");
            ArrayList<EmployeeType> data = (ArrayList<EmployeeType>)query.list();
            session.getTransaction().commit();
            return data;
        }
        
        catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
            return null;
        }
        finally {
            session.close();
        }
            
            /*   Connection c = new CommonDB().getConnection();
            ps=c.prepareStatement("select * from employee_type_master where emp_org_id = '"+userBean.getUserOrgCode()+"'");
            rs=ps.executeQuery();
            ArrayList<EmployeeType> data = new ArrayList<EmployeeType>();
            while(rs.next())
            {
                EmployeeType dept = new EmployeeType();
                dept.setCode(rs.getInt(1));
                dept.setEmpTypeCode(rs.getString(2));
                dept.setName(rs.getString(3));
                dept.setNickname(rs.getString(4));
                dept.setPfApplies(rs.getBoolean(5));
                dept.setMaxpf(rs.getInt(6));
                data.add(dept);
            }
            rs.close();
            ps.close();
            c.close();          
            return data;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }       */
    }
    //public Exception save(String empName,String empNickname,boolean pf,int maxpf) 
    public Exception save(EmployeeType emptype){
        try
        {
              
            EmployeeType emp = new EmployeeType();
            
            emp.setEmpTypeCode(emptype.getEmpTypeCode().toUpperCase());
            emp.setName(emptype.getName().toUpperCase());
            emp.setNickname(emptype.getNickname().toUpperCase());
            emp.setPfApplies(emptype.isPfApplies());
            emp.setMaxpf(emptype.getMaxpf());
            emp.setOrgcode(userBean.getUserOrgCode());
            
            session = helper.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(emp);
            session.getTransaction().commit();
            return null;
        }
        catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
            return e;
        }
        finally {
            session.close();
        }
            
            
            /*      Connection c = new CommonDB().getConnection();
            ps=c.prepareStatement("insert into employee_type_master(emp_tcode,emp_type_name,emp_type_nickname,emp_pf_applies,emp_maxpf_applies,emp_org_id) values(?,?,?,?,?,?)");
            ps.setString(1,emptype.getEmpTypeCode());
            ps.setString(2, emptype.getName().toUpperCase());
            ps.setString(3, emptype.getNickname().toUpperCase());
            ps.setBoolean(4, emptype.isPfApplies());
            ps.setInt(5, emptype.getMaxpf());
            ps.setInt(6, userBean.getUserOrgCode());
            ps.executeUpdate();
            ps.close();
            c.close();          
            
            
            return null;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return e;
        }           */

    }

}
