/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.marc;

import com.myapp.struts.hbm.Biblio;
import com.myapp.struts.hbm.BiblioId;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author zeeshan
 */
public class CatAction6 extends org.apache.struts.action.Action {
    
    /* forward name="success" path="" */
   
    
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
     
    HashMap hm1=new HashMap();

     MarcHibDAO marchib=new MarcHibDAO();
    
    MarcHibDAO dao=new MarcHibDAO();

     Biblio biblio=new Biblio();
     BiblioId biblioid= new BiblioId();

     Biblio biblio1=new Biblio();
     BiblioId biblioid1= new BiblioId();
        System.out.println("inside cataction6 !");
        CatActionForm6 caf6=(CatActionForm6)form;

        HttpSession session = request.getSession();
       int  bibid = (Integer)session.getAttribute("biblio_id");
        System.out.println("************************************************  "+bibid);
        String library_id = (String) session.getAttribute("library_id");
        String sub_library_id = (String) session.getAttribute("sublibrary_id");



        String t=caf6.getZclick();             // t is click value on jsp

         String z600a,z600b,z600c,z600d, z650a,z650b,z650c,z650d,z650e,z6504,z650v,z650x,z650y,z650z,z6502,zclick;
         Character in6001,in6002,in6501,in6502;

         // getting values of indicator fields from CatActionForm6
         in6001=caf6.getIn6001();
         in6002=caf6.getIn6002();
         in6501=caf6.getIn6501();
         in6502=caf6.getIn6502();

           //getting values of subfields from CatActionForm6
                z600a=caf6.getZ600a();
                z600b=caf6.getZ600b();
                z600c=caf6.getZ600c();
                z600d=caf6.getZ600d();

                z650a=caf6.getZ650a();
                z650b=caf6.getZ650b();
                z650c=caf6.getZ650c();
                z650d=caf6.getZ650d();
                z650e=caf6.getZ650e();
                z6504=caf6.getZ6504();
                z650v=caf6.getZ650v();
                z650x=caf6.getZ650x();
                z650y=caf6.getZ650y();
                z650z=caf6.getZ650z();
                z6502=caf6.getZ6502();

        //filling object with data for MARC Tag 600
                biblioid.setLibraryId(library_id);
                biblio.setSublibraryId(sub_library_id);
                biblioid.setMarctag("600");
                if(caf6.getIn6001()!=null)
                if(StringUtils.isNotBlank(in6001.toString())&&StringUtils.isNotEmpty(in6001.toString()))
                biblio.setIndicator1(in6001);
                if(caf6.getIn6002()!=null)
                if(StringUtils.isNotBlank(in6002.toString())&&StringUtils.isNotEmpty(in6002.toString()))
                biblio.setIndicator2(in6002);
                if(StringUtils.isNotBlank(z600a)&&StringUtils.isNotEmpty(z600a))
                biblio.set$a(z600a);
               if(StringUtils.isNotBlank(z600b)&&StringUtils.isNotEmpty(z600b))
                    biblio.set$b(z600b);
               if(StringUtils.isNotBlank(z600c)&&StringUtils.isNotEmpty(z600c))
                    biblio.set$c(z600c);
               if(StringUtils.isNotBlank(z600d)&&StringUtils.isNotEmpty(z600d))
                biblio.set$d(z600d);
                   biblioid.setBibId(bibid);
                       biblio.setId(biblioid);
//                       marchib.insert(biblio);
                       hm1=(HashMap)session.getAttribute("hsmp");
                       if(hm1==null)
                           hm1=new HashMap();

//if(hm1.containsKey("26")){
    //        hm1.remove("26");
    //    }
 hm1.put("26", biblio);

                

                     //filling object with data for MARC Tag 650
                biblioid1.setLibraryId(library_id);
                biblio1.setSublibraryId(sub_library_id);
                biblioid1.setMarctag("650");
         if(caf6.getIn6501()!=null)
                if(StringUtils.isNotBlank(in6501.toString())&&StringUtils.isNotEmpty(in6501.toString()))
                biblio1.setIndicator1(in6501);
        if(caf6.getIn6502()!=null)
                if(StringUtils.isNotBlank(in6502.toString())&&StringUtils.isNotEmpty(in6502.toString()))
                biblio1.setIndicator2(in6502);
if(StringUtils.isNotBlank(z650a)&&StringUtils.isNotEmpty(z650a))
                biblio1.set$a(z650a);
if(StringUtils.isNotBlank(z650b)&&StringUtils.isNotEmpty(z650b))
                biblio1.set$b(z650b);
           if(StringUtils.isNotBlank(z650c)&&StringUtils.isNotEmpty(z650c))
                    biblio1.set$c(z650c);
if(StringUtils.isNotBlank(z650d)&&StringUtils.isNotEmpty(z650d))
                    biblio1.set$d(z650d);
           if(StringUtils.isNotBlank(z650e)&&StringUtils.isNotEmpty(z650e))
                    biblio1.set$e(z650e);
  if(StringUtils.isNotBlank(z6504)&&StringUtils.isNotEmpty(z6504))
                    biblio1.set$4(z6504);
           if(StringUtils.isNotBlank(z650v)&&StringUtils.isNotEmpty(z650v))
                    biblio1.set$a(z650v);
           if(StringUtils.isNotBlank(z650x)&&StringUtils.isNotEmpty(z650x))
                    biblio1.set$b(z650x);
             if(StringUtils.isNotBlank(z650y)&&StringUtils.isNotEmpty(z650y))
                biblio1.set$c(z650y);
          if(StringUtils.isNotBlank(z650z)&&StringUtils.isNotEmpty(z650z))
                    biblio1.set$d(z650z);
        if(StringUtils.isNotBlank(z6502)&&StringUtils.isNotEmpty(z6502))
                    biblio1.set$2(z6502);

                    biblioid1.setBibId(bibid);
                       biblio1.setId(biblioid1);
//                       marchib.insert(biblio1);
//if(hm1.containsKey("27")){
       //     hm1.remove("27");
       // }
 hm1.put("27", biblio1);

     session.setAttribute("hsmp", hm1);

             System.out.println("All both objects saved now NAvigating to page "+t);
             //code for mapping forwards......
                     if(t.equals("0"))
                    {
                        return mapping.findForward("forward0");
                    }
                    else if(t.equals("1")){
                            return mapping.findForward("forward1");
                    }
                     else if(t.equals("2")){
                            return mapping.findForward("forward2");
                    }
                    else if(t.equals("3")){
                            return mapping.findForward("forward3");
                    }
                    else if(t.equals("4")){

                            return mapping.findForward("forward4");
                    }

                    else if(t.equals("5")){
                            return mapping.findForward("forward5");
                    }
                    else if(t.equals("7")){
                            return mapping.findForward("forward7");
                    }
                    else if(t.equals("8")){
                            return mapping.findForward("forward8");
                    }
                    else if(t.equals("9"))
                    {
                            return mapping.findForward("forward9");
                    }
        else if(t.equals("10"))
        {
        return mapping.findForward("forward10");
        }

                    return mapping.findForward("forward6");
                }
}
