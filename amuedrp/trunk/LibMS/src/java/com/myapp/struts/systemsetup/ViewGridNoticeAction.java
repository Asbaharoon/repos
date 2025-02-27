/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.systemsetup;
import com.myapp.struts.systemsetupDAO.*;
import com.myapp.struts.hbm.*;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author edrp01
 */
public class ViewGridNoticeAction extends org.apache.struts.action.Action {
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    String library_id;
    String button;
    String sub_lib;
   
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        NoticeDAO notdao=new NoticeDAO();
        //AddNoticeActionForm  acn =(AddNoticeActionForm)form;
            //Integer notice_id =  acn.getNotice_id();
             HttpSession session=request.getSession();
             library_id=(String)session.getAttribute("library_id");
              sub_lib=(String)session.getAttribute("sublibrary_id");
         String notice_id =request.getParameter("notice_id");
         Notices   notice=notdao.getNoticeName(library_id, notice_id, sub_lib);
        if(notice!=null)
         {
               request.setAttribute("button", "View");
               request.setAttribute("notice", notice);
               return  mapping.findForward("view");
         }

     return null;
    }
}
