/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts.cataloguing;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.myapp.struts.cataloguingDAO.BibliographicEntryDAO;
import com.myapp.struts.hbm.*;
import com.myapp.struts.systemsetupDAO.DocumentCategoryDAO;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import java.util.Locale;
import java.util.ResourceBundle;
import com.myapp.struts.utility.DateCalculation;
import org.jfree.chart.labels.BubbleXYItemLabelGenerator;
public class AccessionEntryAction extends org.apache.struts.action.Action {

    private static final String SUCCESS = "success";
    BibliographicEntryDAO dao = new BibliographicEntryDAO();
    BibliographicDetails bib = new BibliographicDetails();
    BibliographicDetailsId bid = new BibliographicDetailsId();
    DocumentDetails doc = new DocumentDetails();
    DocumentDetailsId did = new DocumentDetailsId();
    AccessionRegister ac = new AccessionRegister();
    AccessionRegisterId aid = new AccessionRegisterId();
    Locale locale=null;
    String locale1="en";
    String rtl="ltr";
    String align="left";
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        BibliographicDetailEntryActionForm bform = (BibliographicDetailEntryActionForm) form;
        HttpSession session = request.getSession();
        String library_id = (String) session.getAttribute("library_id");
        String sub_library_id = (String) session.getAttribute("sublibrary_id");
        DocumentCategoryDAO doccatdao=new DocumentCategoryDAO();
        BibliographicEntryDAO bibdao=new BibliographicEntryDAO();

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
    if(!(locale1.equals("ur")||locale1.equals("ar"))){ rtl="LTR";align="left";}
    else{ rtl="RTL";align="right";}
    ResourceBundle resource = ResourceBundle.getBundle("multiLingualBundle", locale);
        String acc_no1 = (String) bform.getAccession_no();
        String button = (String) bform.getButton();
        String lan=(String) bform.getLanguage().toUpperCase();
        System.out.println(lan+"             :::::::::::::");
        String acc_no=lan+acc_no1;
        System.out.println("Sambhalke         "+acc_no);
        if (button.equals("Add Item")) {
            if (StringUtils.isEmpty(acc_no)) {
String msg1 = resource.getString("cataloguing.ownaccessionentryaction.accessblank");//Accession no field can not be left blank
                request.setAttribute("msg2", msg1);
            } else {
                AccessionRegister hh = dao.searchacc(library_id, sub_library_id, acc_no);
                if (hh != null) {
                    String msg1 = resource.getString("cataloguing.ownaccessionentryaction.accessduplicate");//This accession no already exists enter different
                    request.setAttribute("msg2", msg1);
                } else {
                    BibliographicDetailsId dd = new BibliographicDetailsId(bform.getBiblio_id(), library_id, sub_library_id);
                    bib.setId(dd);
                    //bib=bibdao.getBiblio(library_id, sub_library_id, bform.getBiblio_id());
                    Integer maxdoc = dao.returnMaxDocumentId(library_id, sub_library_id);
                    Integer maxrecord = (Integer) dao.returnMaxRecord(library_id, sub_library_id);
                    did.setDocumentId(maxdoc);
                    did.setLibraryId(library_id);
                    did.setSublibraryId(sub_library_id);
                    doc.setId(did);
                    doc.setBibliographicDetails(bib);
                    doc.setStatus("available");
                    doc.setDocumentType(bform.getDocument_type());
                    doc.setAccessionType(bform.getAccession_type());
                    doc.setRecordNo(maxrecord);
                    doc.setTitle(bform.getTitle());
                    doc.setSubtitle(bform.getSubtitle());
                    DocumentCategory dc = (DocumentCategory)doccatdao.searchDocumentCategoryByName(library_id, sub_library_id, bform.getBook_type());
                    if(dc!=null)
                        doc.setBookType(dc.getId().getDocumentCategoryId());
                    else
                    doc.setBookType(bform.getBook_type());
                    doc.setSubject(bform.getSubject());
                    doc.setAltTitle(bform.getAlt_title());
                    doc.setEdition(bform.getEdition());
                    doc.setStatementResponsibility(bform.getStatement_responsibility());
                    doc.setMainEntry(bform.getMain_entry());
                    doc.setPublisherName(bform.getPublisher_name());
                    doc.setPublicationPlace(bform.getPublication_place());
                    doc.setAddedEntry(bform.getAdded_entry());
                    doc.setAddedEntry1(bform.getAdded_entry0());
                    doc.setAddedEntry2(bform.getAdded_entry1());
                    doc.setAddedEntry3(bform.getAdded_entry2());
                    doc.setPublishingYear(bform.getPublishing_year());
                    doc.setLccNo(bform.getLCC_no());
                    doc.setCallNo(bform.getCall_no());
                    doc.setIsbn10(bform.getIsbn10());
                    doc.setIsbn13(bform.getIsbn13());
                    doc.setVolumeNo(bform.getVolume_no());
                    doc.setAccessionNo(acc_no);
                    doc.setLocation(bform.getLocation());
                    doc.setShelvingLocation(bform.getShelving_location());
                    doc.setIndexNo(bform.getIndex_no());
                    doc.setNoOfPages(bform.getNo_of_pages());
                    doc.setSeries(bform.getSer_note());
                    doc.setAbstract_(bform.getThesis_abstract());
                    doc.setCollation1(bform.getPhysical_width());
                    doc.setBindType(bform.getBind_type());
                    doc.setNotes(bform.getNotes());
                    doc.setBiblioId(bform.getBiblio_id());
                    doc.setPhysicalForm(bform.getPhysical_form());
                    doc.setTypeOfDisc(bform.getType_of_disc());
                    doc.setColour(bform.getColour());
                    doc.setEntryLanguage(bform.getLanguage());
                    doc.setDateAcquired(DateCalculation.now());
                   
                    //Disseration Entry
                     doc.setSubmittedBy(bform.getSubmittedBy());
                     doc.setGuideName(bform.getGuide_name());
                     doc.setSubmittedOn(bform.getSubmitted_on());
                     doc.setDegree(bform.getDegree());
                     doc.setAcceptanceYear(bform.getAcceptance_year());
                     

                     


                    aid.setLibraryId(library_id);
                    aid.setSublibraryId(sub_library_id);
                    aid.setRecordNo(maxrecord);
                    ac.setId(aid);
                    ac.setAccessionNo(acc_no);
                    ac.setBiblioId(bform.getBiblio_id());
                    ac.setBibliographicDetails(bib);
                    ac.setVolumeNo(bform.getVolume_no());
                    ac.setLocation(bform.getLocation());
                    ac.setShelvingLocation(bform.getShelving_location());
                    ac.setIndexNo(bform.getIndex_no());
                    ac.setNoOfPages(bform.getNo_of_pages());
                    ac.setPhysicalWidth(bform.getPhysical_width());
                    ac.setBindType(bform.getBind_type());
                    ac.setPhysicalDescription(bform.getPhysical_desc());
                    ac.setPhysicalForm(bform.getPhysical_form());
                    ac.setColour(bform.getColour());
                    ac.setDateAcquired(DateCalculation.now());
                    dao.insert2(ac);
                    bib=dao.getBiblio(library_id, sub_library_id, bform.getBiblio_id());
                    //bid.setLibraryId(library_id);
                    //bid.setSublibraryId(sub_library_id);
                    //bib.setId(bid);
                    //bib.setBookType(bform.getBook_type());
                   // DocumentCategory dc1 = (DocumentCategory)doccatdao.searchDocumentCategoryByName(library_id, sub_library_id, bform.getBook_type());
                   // if(dc1!=null)
                    //    bib.setBookType(dc1.getId().getDocumentCategoryId());
                   // else
                      //  bib.setBookType(bform.getBook_type());
                  //  bib.setDocumentType(bform.getDocument_type());
                   // bib.setTitle(bform.getTitle());
                   // bib.setSubtitle(bform.getSubtitle());
                   // bib.setStatementResponsibility(bform.getStatement_responsibility());
                   // bib.setMainEntry(bform.getMain_entry());
                   // bib.setAddedEntry(bform.getAdded_entry());
                  //  bib.setAddedEntry1(bform.getAdded_entry0());
                   // bib.setAddedEntry2(bform.getAdded_entry1());
                   // bib.setAddedEntry3(bform.getAdded_entry2());
                  //  bib.setPublisherName(bform.getPublisher_name());
                  //  bib.setPublicationPlace(bform.getPublication_place());
                  //  bib.setPublishingYear(Integer.parseInt(bform.getPublishing_year()));
                  //  bib.setLccNo(bform.getLCC_no());
                  //  bib.setIsbn10(bform.getIsbn10());
                  //  bib.setIsbn13(bform.getIsbn13());
                  //  bib.setEdition(bform.getEdition());
                  //  bib.setCallNo(bform.getCall_no());
                 //   bib.setAltTitle(bform.getAlt_title());
                 //   bib.setSubject(bform.getSubject());
                 //   bib.setAbstract_(bform.getThesis_abstract());
                 //   bib.setSeries(bform.getSer_note());
                  //  bib.setNotes(bform.getNotes());
                  //  bib.setEntryLanguage(bform.getLanguage());
                  //  bib.setTypeOfDisc(bform.getType_of_disc());
                 //   bib.setDateAcquired(bform.getDate_acquired1());
                    List a = dao.getItems(library_id, sub_library_id, bform.getBiblio_id());
                    int b = a.size();
                    bform.setNo_of_copies(b);
                    doc.setNoOfCopies(b);
                    bib.setNoOfCopies(b);
                    dao.update(bib);
                    dao.insert1(doc);
                     String msg2 = resource.getString("cataloguing.ownaccessionentryaction.accessdatasave")+maxrecord;//Item is saved successfully with record no:
                    request.setAttribute("msg1", msg2);
                    return mapping.findForward(SUCCESS);
                }
            }
        }
        return mapping.findForward(SUCCESS);
    }
}
