/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts.cataloguing;

import com.myapp.struts.cataloguingDAO.BibliographicEntryDAO;
import com.myapp.struts.hbm.AccessionRegister;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.myapp.struts.utility.StringRegEx;
/**
 *
 * @author <a href="mailto:asif633@gmail.com">Asif Iqubal</a>
 */
public class AccessionSingleEdit extends org.apache.struts.action.Action {

    BibliographicEntryDAO dao = new BibliographicEntryDAO();
    AccessionRegister bib=new AccessionRegister();

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        BibliographicDetailEntryActionForm bibform = (BibliographicDetailEntryActionForm) form;
        HttpSession session1 = request.getSession();
        String library_id = (String) session1.getAttribute("library_id");
        String sub_library_id = (String) session1.getAttribute("sublibrary_id");
        String doc_tpe=(String)session1.getAttribute("doc_type");
        String ii=bibform.getAccession_no();
        String buttonhand=bibform.getButton();
                if(buttonhand==null || buttonhand.isEmpty())
            buttonhand=(String)session1.getAttribute("edit2");
        System.out.println("MASTIIIIIIIIIIII"+buttonhand+"/");
String bb=StringRegEx.sepByRegEx(ii).toString();
 System.out.println("M     "+bb+" /");
 String vv=ii.substring(bb.length());
 System.out.println("M     "+vv+" /");
 session1.removeAttribute("edit2");
        int i=0;
        if(doc_tpe.equals("Book"))
        {
            if (buttonhand.equals("View")||buttonhand.equals("Edit")||buttonhand.equals("Delete")) {
                    bib = dao.searchacc(library_id, sub_library_id,ii);
                    if (bib != null) {
                        if (bib.getBibliographicDetails().getNoOfCopies() == null) {
                            i = 0;
                        } else {
                            i = bib.getBibliographicDetails().getNoOfCopies();
                        }
                        
                        bibform.setNo_of_copies(i);
                        bibform.setMain_entry(bib.getBibliographicDetails().getMainEntry());
                        bibform.setAdded_entry(bib.getBibliographicDetails().getAddedEntry());
                        bibform.setAdded_entry0(bib.getBibliographicDetails().getAddedEntry1());
                        bibform.setAdded_entry1(bib.getBibliographicDetails().getAddedEntry2());
                        bibform.setAdded_entry2(bib.getBibliographicDetails().getAddedEntry3());
                        bibform.setBiblio_id(bib.getBibliographicDetails().getId().getBiblioId());
                        bibform.setSer_note(bib.getBibliographicDetails().getSeries());
                        bibform.setLCC_no(bib.getBibliographicDetails().getLccNo());
                        bibform.setDocument_type(bib.getBibliographicDetails().getDocumentType());
                        bibform.setEdition(bib.getBibliographicDetails().getEdition());
                        bibform.setIsbn10(bib.getBibliographicDetails().getIsbn10());
                        bibform.setIsbn13(bib.getBibliographicDetails().getIsbn13());
                        bibform.setLibrary_id(bib.getId().getLibraryId());
                        bibform.setSub_library_id(bib.getId().getSublibraryId());
                        bibform.setPublication_place(bib.getBibliographicDetails().getPublicationPlace());
                        bibform.setPublisher_name(bib.getBibliographicDetails().getPublisherName());
                        bibform.setPublishing_year(String.valueOf(bib.getBibliographicDetails().getPublishingYear()));
                        bibform.setSubtitle(bib.getBibliographicDetails().getSubtitle());
                        bibform.setTitle(bib.getBibliographicDetails().getTitle());
                        bibform.setCall_no(bib.getBibliographicDetails().getCallNo());
                        bibform.setAccession_type(bib.getBibliographicDetails().getAccessionType());
                        bibform.setBook_type(bib.getBibliographicDetails().getBookType());
                        bibform.setStatement_responsibility(bib.getBibliographicDetails().getStatementResponsibility());
                        bibform.setAlt_title(bib.getBibliographicDetails().getAltTitle());
                        bibform.setRecord_no(bib.getId().getRecordNo());
                        bibform.setAccession_no(vv);
                        bibform.setVolume_no(bib.getVolumeNo());
                        bibform.setLocation(bib.getLocation());
                        bibform.setShelving_location(bib.getShelvingLocation());
                        bibform.setNo_of_pages(bib.getNoOfPages());
                        bibform.setIndex_no(bib.getIndexNo());
                        bibform.setPhysical_width(bib.getPhysicalWidth());
                        bibform.setBind_type(bib.getBindType());
                        bibform.setLanguage(bib.getBibliographicDetails().getEntryLanguage());
                        bibform.setDate_acquired(bib.getDateAcquired());
                        bibform.setDate_acquired1(bib.getBibliographicDetails().getDateAcquired());
                        System.out.println("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"+bib.getDateAcquired());
                        return mapping.findForward("show");
                    }
    }
        }
            else if(doc_tpe.equals("CD")){
 if (buttonhand.equals("View")||buttonhand.equals("Edit")||buttonhand.equals("Delete")) {
                    bib = dao.searchacc(library_id, sub_library_id,ii);
                    if (bib != null) {
                        if (bib.getBibliographicDetails().getNoOfCopies() == null) {
                            i = 0;
                        } else {
                            i = bib.getBibliographicDetails().getNoOfCopies();
                        }
                        bibform.setNo_of_copies(i);
                        bibform.setMain_entry(bib.getBibliographicDetails().getMainEntry());
                        bibform.setAdded_entry(bib.getBibliographicDetails().getAddedEntry());
                        bibform.setAdded_entry0(bib.getBibliographicDetails().getAddedEntry1());
                        bibform.setAdded_entry1(bib.getBibliographicDetails().getAddedEntry2());
                        bibform.setAdded_entry2(bib.getBibliographicDetails().getAddedEntry3());
                        bibform.setBiblio_id(bib.getBibliographicDetails().getId().getBiblioId());
                        bibform.setSer_note(bib.getBibliographicDetails().getSeries());
                        bibform.setLCC_no(bib.getBibliographicDetails().getLccNo());
                        bibform.setDocument_type(bib.getBibliographicDetails().getDocumentType());
                        bibform.setEdition(bib.getBibliographicDetails().getEdition());
                        bibform.setIsbn10(bib.getBibliographicDetails().getIsbn10());
                        bibform.setIsbn13(bib.getBibliographicDetails().getIsbn13());
                        bibform.setLibrary_id(bib.getId().getLibraryId());
                        bibform.setSub_library_id(bib.getId().getSublibraryId());
                        bibform.setPublication_place(bib.getBibliographicDetails().getPublicationPlace());
                        bibform.setPublisher_name(bib.getBibliographicDetails().getPublisherName());
                        bibform.setPublishing_year(String.valueOf(bib.getBibliographicDetails().getPublishingYear()));
                        bibform.setSubtitle(bib.getBibliographicDetails().getSubtitle());
                        bibform.setTitle(bib.getBibliographicDetails().getTitle());
                        bibform.setCall_no(bib.getBibliographicDetails().getCallNo());
                        bibform.setAccession_type(bib.getBibliographicDetails().getAccessionType());
                        bibform.setBook_type(bib.getBibliographicDetails().getBookType());
                        bibform.setStatement_responsibility(bib.getBibliographicDetails().getStatementResponsibility());
                        bibform.setAlt_title(bib.getBibliographicDetails().getAltTitle());
                        bibform.setRecord_no(bib.getId().getRecordNo());
                        bibform.setAccession_no(vv);
                        bibform.setVolume_no(bib.getVolumeNo());
                        bibform.setLocation(bib.getLocation());
                        bibform.setShelving_location(bib.getShelvingLocation());
                        bibform.setNo_of_pages(bib.getNoOfPages());
                        bibform.setIndex_no(bib.getIndexNo());
                        bibform.setPhysical_width(bib.getPhysicalWidth());
                        bibform.setBind_type(bib.getBindType());
                        bibform.setType_of_disc(bib.getBibliographicDetails().getTypeOfDisc());
                        bibform.setPhysical_desc(bib.getPhysicalDescription());
                        bibform.setPhysical_form(bib.getPhysicalForm());
                        bibform.setColour(bib.getColour());
                        bibform.setLanguage(bib.getBibliographicDetails().getEntryLanguage());
                        bibform.setDate_acquired(bib.getDateAcquired());
                        bibform.setDate_acquired1(bib.getBibliographicDetails().getDateAcquired());
                        return mapping.findForward("show");
                    }
    }
            }

        return mapping.findForward("show");
    }
}