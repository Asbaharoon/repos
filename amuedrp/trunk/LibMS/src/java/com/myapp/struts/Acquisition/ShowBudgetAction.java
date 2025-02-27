/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.Acquisition;

import com.myapp.struts.hbm.AcqBudget;
import com.myapp.struts.AcquisitionDao.BudgetDAO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author edrp02
 */
public class ShowBudgetAction extends org.apache.struts.action.Action {
  
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    String dept_id;
    String library_id;
    String button;
    BudgetDAO buddao=new BudgetDAO();
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession session=request.getSession();
        library_id=(String)session.getAttribute("library_id");
       
     List<AcqBudget> budget=buddao.getBudget(library_id);
      session.setAttribute("budgets", budget);
         if(!budget.isEmpty())
         {
              session.setAttribute("budgets", budget);
               return  mapping.findForward("success");
         }
         else
         {
          request.setAttribute("msg1", "No Budget Head Created Yet");
            return  mapping.findForward("success");

         }

    
    }
}
