/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.circulation;

import com.myapp.struts.CirDAO.CirculationDAO;
import com.myapp.struts.hbm.*;
import java.util.Locale;
import java.util.ResourceBundle;
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
public class CirCheckinbookdetailAction extends org.apache.struts.action.Action {
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private String checkout_id;
     Locale locale=null;
   String locale1="en";
   String rtl="ltr";
   String align="left";
    
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
CirculationDAO cirdao=new CirculationDAO();
        CirCheckinActionForm myform = (CirCheckinActionForm)form;
        HttpSession session = request.getSession();
          try{

        locale1=(String)session.getAttribute("locale");
    if(session.getAttribute("locale")!=null)
    {
        locale1 = (String)session.getAttribute("locale");
        System.out.println("locale="+locale1);
    }
    else locale1="en";
}catch(Exception e){locale1="en";}
     locale = new Locale(locale1);
    if(!(locale1.equals("ur")||locale1.equals("ar"))){ rtl="LTR";align = "left";}
    else{ rtl="RTL";align="right";}
    ResourceBundle resource = ResourceBundle.getBundle("multiLingualBundle", locale);

        String document_id = "";
        String accno = myform.getTXTACCESSION();
        String memid = myform.getTXTMEMID();
        String library_id = (String)session.getAttribute("library_id");
        String sublibrary_id = (String)session.getAttribute("sublibrary_id");
        String returnningDate = (String)myform.getTXTRETURNINGDATE();
        String fine = String.valueOf(myform.getTXTFINE());
        String damaged=myform.getTXTDAMAGEDSTATUS();
        String reason=myform.getTXTREASON();
        String loss=myform.getTXTLOSSSTATUS();

        CirculationDAO cirDAO = new CirculationDAO();
//getting value from document detail tables and update the status
        DocumentDetails doc = (DocumentDetails)cirdao.searchDocumentID(library_id, sublibrary_id, accno);
        if(doc!=null)
        {
             document_id = String.valueOf(doc.getId().getDocumentId());
             doc.setStatus("available");
//getting values from checkout table where status is issued and respective document Id
        CirCheckout circheckout = (CirCheckout)cirdao.searchCheckOutDetailsByStatus(library_id, sublibrary_id, document_id,"issued");
        if(circheckout!=null){
         checkout_id = String.valueOf(circheckout.getId().getCheckoutId());
            circheckout.setStatus("returned");

//setting variable for checkin table
            Integer checkinId = cirDAO.returnMaxCheckInId(library_id, sublibrary_id);
            CirCheckin circheckin = new CirCheckin();
            CirCheckinId cirId = new CirCheckinId(String.valueOf(checkinId), library_id, sublibrary_id);
            circheckin.setId(cirId);
            circheckin.setMemberId(circheckout.getMemid());
            circheckin.setReturningDate(returnningDate);
            circheckin.setDocumentId(circheckout.getDocumentId());
            circheckin.setDamagedStatus(damaged);
            circheckin.setReason(reason);
            circheckin.setLossStatus(loss);



            circheckin.setCirCheckout(circheckout);
            circheckin.getCirCheckout().getId().setCheckoutId(circheckout.getId().getCheckoutId());
            
//setting variables for cir transaction history
            CirTransactionHistory cirHistory = (CirTransactionHistory)cirdao.searchCirTransactionHistory(library_id, sublibrary_id, Integer.parseInt(checkout_id));
            cirHistory.setCheckinDate(returnningDate);
            cirHistory.setCheckinId(checkinId);
            cirHistory.setIssueDate(circheckout.getIssueDate());
            Float i  =Float.parseFloat(fine);
            cirHistory.setFineAmt(i);
            cirHistory.setStatus("returned");
//setting values for circulation member account table
            CirMemberAccount cirmemAccount = (CirMemberAccount)cirdao.searchCirMemAccountDetails(library_id,sublibrary_id,memid);
            Integer noofissuebook = Integer.parseInt(cirmemAccount.getCurrentIssuedBook())-1;
            cirmemAccount.setCurrentIssuedBook(String.valueOf(noofissuebook));
            float fine1 = Float.parseFloat(cirmemAccount.getFine());
            fine1 += Float.parseFloat(fine);
            cirmemAccount.setFine(String.valueOf(fine1));

boolean check = cirdao.updateCheckin(circheckin, circheckout, cirmemAccount, doc, cirHistory);
if (check==true)
{
   // request.setAttribute("msg", "CheckIn Process Succesfully Completed");
    request.setAttribute("msg", resource.getString("circulation.circhkinbookdetailAction.chkinsuccfullycomplt"));
    return mapping.findForward(SUCCESS);
}
else
        return mapping.findForward("failure");
        }
        }

            return mapping.findForward("failure");

    }
}
