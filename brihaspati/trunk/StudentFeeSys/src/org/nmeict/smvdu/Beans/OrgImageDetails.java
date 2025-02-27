package org.nmeict.smvdu.Beans;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.UIData;
import javax.faces.context.FacesContext;

import org.nmeict.smvdu.Beans.SpringClassFile.IOrgImageDetailsService;
import org.nmeict.smvdu.Beans.SpringClassFile.OrgImageDetailsService;
import org.nmeict.smvdu.HibernateHelper.OrgProfileSessionDetails;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;



/**
 * OrgImageDetails generated by hbm2java
 * @author Shaista Bano
 */


@ManagedBean (name="orgImageDetails")
@SessionScoped
public class OrgImageDetails  implements java.io.Serializable {


     private Integer imgSeqNo;
     private OrgProfile orgProfileByOrgId;
     private OrgProfile orgProfileByUserId;
     private String imgPath;
     private String imgName;
     private Byte imgProfileFlag;
     private Date upDate;
     
     
     private UIData dataGrid;
     private List<OrgImageDetails> imageList;
     private String userId;
     private IOrgImageDetailsService iOrgImageDetailsService= new OrgImageDetailsService();
    public OrgImageDetails() {
    }

    public OrgImageDetails(OrgProfile orgProfileByOrgId, OrgProfile orgProfileByUserId, String imgPath, String imgName, Byte imgProfileFlag,Date upDate) {
       this.orgProfileByOrgId = orgProfileByOrgId;
       this.orgProfileByUserId = orgProfileByUserId;
       this.imgPath = imgPath;
       this.imgName = imgName;
       this.imgProfileFlag = imgProfileFlag;
       this.upDate = upDate;
    }
   
    public Integer getImgSeqNo() {
        return this.imgSeqNo;
    }
    
    public void setImgSeqNo(Integer imgSeqNo) {
        this.imgSeqNo = imgSeqNo;
    }
    public OrgProfile getOrgProfileByOrgId() {
        return this.orgProfileByOrgId;
    }
    
    public void setOrgProfileByOrgId(OrgProfile orgProfileByOrgId) {
        this.orgProfileByOrgId = orgProfileByOrgId;
    }
    public OrgProfile getOrgProfileByUserId() {
        return this.orgProfileByUserId;
    }
    
    public void setOrgProfileByUserId(OrgProfile orgProfileByUserId) {
        this.orgProfileByUserId = orgProfileByUserId;
    }
    public String getImgPath() {
        return this.imgPath;
    }
    
    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
    public String getImgName() {
        return this.imgName;
    }
    
    public void setImgName(String imgName) {
        this.imgName = imgName;
    }
    public Byte getImgProfileFlag() {
        return this.imgProfileFlag;
    }
    
    public void setImgProfileFlag(Byte imgProfileFlag) {
        this.imgProfileFlag = imgProfileFlag;
    }

	public Date getUpDate() {
		return upDate;
	}

	public void setUpDate(Date upDate) {
		this.upDate = upDate;
	}
    
	
	
    
	public IOrgImageDetailsService getiOrgImageDetailsService() {
		return iOrgImageDetailsService;
	}

	public void setiOrgImageDetailsService(
			IOrgImageDetailsService iOrgImageDetailsService) {
		this.iOrgImageDetailsService = iOrgImageDetailsService;
	}

	
	
	public  void  uploadImage(FileUploadEvent event) throws IOException
	{
		String path = new String();
		String userOrgId = new String();
		String userEmailId = new String();
		File filePath = null;
		UploadedFile uploadFile = event.getFile();
		int size = (int)uploadFile.getSize();
		byte[] imageSize = new byte[size];
		InputStream inputStream = null;
		OutputStream out = null;
		String fileName = uploadFile.getFileName();
		try
		{
			
			synchronized(this)
			{
				userOrgId = new OrgProfileSessionDetails().getUserId();
				userEmailId = new OrgProfileSessionDetails().getOrgProfileSession().getOrgAdminemailid();
				//path= FacesContext.getCurrentInstance().getExternalContext().getRealPath("\\")+"img"+File.separator+userOrgId+File.separator+userEmailId+File.separator;
                                path= FacesContext.getCurrentInstance().getExternalContext().getRealPath("/")+"img"+File.separator+userOrgId+File.separator+userEmailId+File.separator;
				OrgProfile orgProfileEmailId = new OrgProfile();
				orgProfileEmailId.setOrgAdminemailid(userEmailId);
				this.setImgName(fileName);
				this.setImgPath(path);
				this.setUpDate(new Date());
				this.setImgProfileFlag(Byte.parseByte(String.valueOf(0))); 
				this.setOrgProfileByUserId(new OrgProfile(userEmailId));
				getiOrgImageDetailsService().addOrgProfileImage(this);
				
				
				
				filePath = new File(path);
				filePath.mkdir();
				inputStream = event.getFile().getInputstream();
				out = new FileOutputStream(new File(filePath,fileName)); 
				int read = 0;
				while ((read = inputStream.read(imageSize)) != -1) 
				{
				    out.write(imageSize, 0, read);
				} 
			}
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			inputStream.close();
			out.flush();
			out.close();
		}
	}

	
	
	public UIData getDataGrid() {
		return dataGrid;
	}

	public void setDataGrid(UIData dataGrid) {
		this.dataGrid = dataGrid;
	}

	public List<OrgImageDetails> getImageList() {
		String userOrgId = new String();
		String userEmailId = new String();
		userOrgId = new OrgProfileSessionDetails().getUserId();
		userEmailId = new OrgProfileSessionDetails().getOrgProfileSession().getOrgAdminemailid();
		imageList = getiOrgImageDetailsService().orgProfileImageList(userOrgId," ");
		//dataGrid.setValue(imageList);
		return imageList;
	}

	public void setImageList(List<OrgImageDetails> imageList) {
		this.imageList = imageList;
	}
 
	
	public List<OrgImageDetails> details(String query)
	{
		String userOrgId = new String();
		userOrgId = new OrgProfileSessionDetails().getUserId();
		return getiOrgImageDetailsService().orgProfileImageList(userOrgId,query);
	}


}


