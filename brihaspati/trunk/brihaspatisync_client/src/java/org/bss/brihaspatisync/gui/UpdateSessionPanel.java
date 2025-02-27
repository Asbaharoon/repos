package org.bss.brihaspatisync.gui;
/**
 * UpdateSessionPanel.java
 *
 * See LICENCE file for usage and redistribution terms
 * Copyright (c) 2011,2015,2016 ETRG, IIT Kanpur.
 */
import java.awt.Cursor;
import java.awt.*;
import javax.swing.*;
import java.util.Vector;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import javax.swing.border.TitledBorder;
import java.util.StringTokenizer;
import java.net.URLEncoder;
import org.bss.brihaspatisync.util.HttpsUtil;
import org.bss.brihaspatisync.util.ClientObject;
import org.bss.brihaspatisync.util.DateUtil;
import javax.swing.SwingWorker;
import javax.swing.JProgressBar;
import javax.swing.SwingUtilities;
import java.net.URLEncoder;
import org.bss.brihaspatisync.network.Log;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.beans.*;
import java.util.Random;
import java.util.*;
/**
 * @author <a href="mailto:ashish.knp@gmail.com">Ashish Yadav </a>
 * @author <a href="mailto:pratibhaayadav@gmail.com">Pratibha </a> Modified for Signalling.
 * @author <a href="mailto:arvindjss17@gmail.com">Arvind Pal </a>  Modified for GUI on 13 Jun 2011
 * @author <a href="mailto:shikhashuklaa@gmail.com">Shikha Shukla </a>Modify for multilingual implementation. 
 * @author <a href="mailto:pradeepmca30@gmail.com">Pradeep kumar pal </a> Update@ Please wait function. 
 * @author <a href="mailto:nehapal2209@gmail.com">Neha Pal</a>Progressbar is added at Update button.
 * @author <a href="mailto:chetnatrivedi1990@gmail.com">Chetna Trivedi</a>
 */

public class UpdateSessionPanel extends JFrame implements ActionListener, MouseListener,PropertyChangeListener{

	private JFrame frame=null;

	/**Button for closing the window*/

        private int day=1;
        private int month=1;
        private int year=2011;
	private int h=0;
        private int m=0;

        private JLabel closeLabel=null;
        private String courseId=null;
	
	/**Panel to hold the close Button*/

        private JPanel buttonPan=null;

	private JPanel mainPanel;
	private JPanel north_Panel;
        private JPanel center_Panel;
        private JPanel south_Panel;
	private Container con=null;

	private String lecture_id="";
	private JLabel lect_name;
        private JLabel lect_Info;
        private JLabel phone,date;
        private JLabel time;
        private JLabel email;
        private JLabel duration;
        private JLabel repeat;
        private JLabel repeat_for_time;
        private JTextField lectName_Text;
        private JTextField phone_Text;
        private JComboBox hourBox;
        private JComboBox minBox;
        
	private JComboBox dayBox;
        private JComboBox monthBox;
        private JComboBox yearBox;
	
        private JComboBox durationBox;
        private JComboBox repeatBox;
        private JComboBox repeat_for_timeBox;
        private JTextField atRate;
        private JTextField urlText;
        private JTextField endText;
        private JScrollPane lectInfo_Pane;
        private JTextArea lecInfoArea;
        private JCheckBox audio;
        private JCheckBox video;
        private JCheckBox whiteboard;
	private JCheckBox mail_send;
        private JButton annBttn;
	private Vector returnVector=null;
	private String lectValue;
	private Log log=Log.getController();	
	private Cursor busyCursor =Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR);
        private Cursor defaultCursor = Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR);
	private ClassLoader clr= this.getClass().getClassLoader();
	private InstructorCSPanel insCSPanel=null;
	
	private JProgressBar progressBar;
        private JButton startButton;
        private JTextArea taskOutput;
        private Task task;

	protected UpdateSessionPanel(int indexnumber,Vector updatevector,InstructorCSPanel insCSPanel) {
		this.insCSPanel=insCSPanel;
        	mainPanel=new JPanel();
                mainPanel.setLayout(new BorderLayout());
		mainPanel.add(createNorthPanel(),BorderLayout.NORTH);
                mainPanel.add(createCenterPanel(),BorderLayout.CENTER);
                mainPanel.add(createSouthPanel(),BorderLayout.SOUTH);
		setLectureValues(indexnumber,updatevector);
		frame=new JFrame();
  		frame.setTitle(Language.getController().getLangValue("UpdateSessionPanel.Title"));                                                                                                           
                /**Setting the title of the Frame*/
                frame.getContentPane().add(mainPanel);                           /**Adding panel to the frame*/
                frame.setSize(850,250);                                          /**Setting the size of the frame*/
                frame.setVisible(true);                                          /**Showing the frame*/
                Dimension dim=Toolkit.getDefaultToolkit().getScreenSize();
                frame.setLocation((((int)dim.getWidth()/2)-425),(((int)dim.getHeight()/2)-125));
	}

	private void setLectureValues(int indexnumber,Vector updatevector){
		try {
			java.util.StringTokenizer str1 = new java.util.StringTokenizer(updatevector.get(indexnumber).toString(),",");
	                lecture_id=decrypt(str1.nextElement().toString());
        	        courseId=decrypt(str1.nextElement().toString());
                	lectName_Text.setText(decrypt(str1.nextElement().toString()));
	                lecInfoArea.setText(decrypt(str1.nextElement().toString()));
        	        String updatemailid=decrypt(str1.nextElement().toString());
                	phone_Text.setText(decrypt(str1.nextElement().toString()));
	                String updatemailidarry[]=updatemailid.split("@");
        	        urlText.setText(updatemailidarry[0]);
	                atRate.setText("@");
        	        endText.setText(updatemailidarry[1]);
                	if((decrypt(str1.nextElement().toString())).equals("1"))
	                        video.setSelected(true);
        	        else
                	        video.setSelected(false);
	                if((decrypt(str1.nextElement().toString())).equals("1"))
        	                audio.setSelected(true);
                	else
	                        audio.setSelected(false);
        	        String sr=decrypt(str1.nextElement().toString());
	
        	        updatemailid=decrypt(str1.nextElement().toString());
                	updatemailidarry=updatemailid.split("-");
	
        	        updatemailid=decrypt(str1.nextElement().toString());//Session Time
                	updatemailidarry=updatemailid.split(":");
			String durationtime=decrypt(str1.nextElement().toString());
			durationtime=durationtime.substring(0,durationtime.indexOf(":"));
			String mail=decrypt(str1.nextElement().toString());
			mail=decrypt(str1.nextElement().toString());
			mail=decrypt(str1.nextElement().toString());
			if(mail.equals("1"))
				mail_send.setSelected(true);		
			else
				mail_send.setSelected(false);
	                durationBox.setSelectedItem(durationtime+Language.getController().getLangValue("UpdateSessionPanel.LectureHour"));	
		} catch(Exception e){System.out.println("Error in Update session in UpdateSessionPanel class ");}	
	}	

	/**
         * This method is used to create GUI for announce a new Session.
         */

        private JPanel createNorthPanel(){
                //Creating North Panel
                north_Panel=new JPanel();
                north_Panel.setLayout(new FlowLayout(FlowLayout.CENTER));
                north_Panel.setBackground(Color.LIGHT_GRAY);
                north_Panel.setBorder(BorderFactory.createLineBorder(Color.black));
                video=new JCheckBox("<html><font color=green>"+Language.getController().getLangValue("UpdateSessionPanel.VideoCheck")+"</font></html>");
                video.setBackground(Color.LIGHT_GRAY);
		video.addActionListener(new ActionListener(){
                                                public void actionPerformed(ActionEvent er){
                                                        if(video.isSelected()){
                                                         new VideoServerConfigure();

                               }
                     }
                });
                audio=new JCheckBox("<html><font color=green>"+Language.getController().getLangValue("UpdateSessionPanel.AudioCheck")+"</font></html>");
                audio.setBackground(Color.LIGHT_GRAY);
                whiteboard=new JCheckBox("<html><font color=green>"+Language.getController().getLangValue("UpdateSessionPanel.WBCheck")+"</font></html>");
                whiteboard.setBackground(Color.LIGHT_GRAY);
		mail_send=new JCheckBox("<html><font color=green>"+Language.getController().getLangValue("mail_send")+"</font></html>");

                mail_send.setBackground(Color.LIGHT_GRAY);	
                north_Panel.add(new JLabel(" "));
                north_Panel.add(audio);
                north_Panel.add(video);
                north_Panel.add(whiteboard);
		north_Panel.add(mail_send);
                whiteboard.setSelected(true);
                north_Panel.add(new JLabel("                            "));
		
		return north_Panel;
	}
	
	private JPanel createCenterPanel(){
		getTimeIndexingServer();
                //Creating Center Panel
                center_Panel=new JPanel();
                center_Panel.setLayout(new GridLayout(0,4,5,2));

                lect_name=new JLabel("<html>&nbsp<font color=black>"+Language.getController().getLangValue("UpdateSessionPanel.LectureName")+"</font><font color=blue>*</font>");
		lect_Info=new JLabel("<html>&nbsp<font color=black>"+Language.getController().getLangValue("UpdateSessionPanel.LectureInfo")+"</font><font color=blue>*</font>");
                phone=new JLabel("<html>&nbsp<font color=black>"+Language.getController().getLangValue("UpdateSessionPanel.Phone")+"</font><font color=blue>*</font>");
                date=new JLabel("<html>&nbsp<font color=black>"+Language.getController().getLangValue("UpdateSessionPanel.LectureDate")+"</font><font color=blue>*</font>");
                time=new JLabel("<html>&nbsp<font color=black>"+Language.getController().getLangValue("UpdateSessionPanel.LectureTime")+"</font><font color=blue>*</font>");
                email=new JLabel("<html>&nbsp<font color=black>"+Language.getController().getLangValue("UpdateSessionPanel.Email")+"</font><font color=blue>*</font>");
                lectName_Text=new JTextField();
                phone_Text=new JTextField();
                lecInfoArea=new JTextArea();
                lectInfo_Pane=new JScrollPane(lecInfoArea);

                //creating a new Panel for date choose
                JPanel dateEntryPanel=new JPanel();
                dateEntryPanel.setLayout(new FlowLayout(FlowLayout.LEFT));
                dayBox=new JComboBox();
                monthBox=new JComboBox();
                yearBox=new JComboBox();

		if(day<10)
                        dayBox.addItem("0"+Integer.toString(day));
                else
                         dayBox.addItem(Integer.toString(day));
		for(int i=1;i<32;i++){
			if(day != i) {
				if(i<10)
                                	dayBox.addItem("0"+Integer.toString(i));
                        	else
                                	dayBox.addItem(Integer.toString(i));
			}
                }
		if(month<10)
                        monthBox.addItem("0"+Integer.toString(month));
                else
                        monthBox.addItem(Integer.toString(month));
                for(int i=1;i<13;i++){
			if(month != i){
				if(i<10)
                                	monthBox.addItem("0"+Integer.toString(i));
                        	else
                                	monthBox.addItem(Integer.toString(i));
			}
                }
		
                for(int i=year;i<=2050;i++)
                        yearBox.addItem(Integer.toString(i));
                dateEntryPanel.add(yearBox);
                dateEntryPanel.add(monthBox);
                dateEntryPanel.add(dayBox);

                //creating a new panel for Time entry
                JPanel timeEntryPanel=new JPanel();
                timeEntryPanel.setLayout(new FlowLayout(FlowLayout.LEFT));
		hourBox=new JComboBox();
		minBox=new JComboBox();
		
		hourBox.addItem(Integer.toString(h));
                for(int i=0;i<=23;i++){
                        if(i<10)
                                hourBox.addItem("0"+Integer.toString(i));
                        else
                                hourBox.addItem(Integer.toString(i));
                }
                minBox.addItem(Integer.toString(m));
                for(int i=0;i<60;i++){
                        if(i<10)
                                minBox.addItem("0"+Integer.toString(i));
                        else
                                minBox.addItem(Integer.toString(i));
                }
		
                timeEntryPanel.add(hourBox);
                timeEntryPanel.add(minBox);

                //creating a new Panel for email entry
                JPanel mailPanel=new JPanel();
                mailPanel.setLayout(new FlowLayout(FlowLayout.CENTER));
                atRate=new JTextField("@");
                atRate.setEditable(false);
                urlText=new JTextField(5);
                endText=new JTextField(5);
                mailPanel.add(urlText);
                mailPanel.add(atRate);
                mailPanel.add(endText);

                center_Panel.add(lect_name);
                center_Panel.add(lectName_Text);
                center_Panel.add(lect_Info);
                center_Panel.add(lectInfo_Pane);
                center_Panel.add(phone);
                center_Panel.add(phone_Text);
                center_Panel.add(date);
                center_Panel.add(dateEntryPanel);
                center_Panel.add(time);
                center_Panel.add(timeEntryPanel);
		return center_Panel;
	}

	private JPanel createSouthPanel(){
                //creating South Panel
                south_Panel=new JPanel();
                south_Panel.setLayout(new FlowLayout(FlowLayout.LEFT));
		south_Panel.setBackground(Color.LIGHT_GRAY);
                south_Panel.setBorder(BorderFactory.createLineBorder(Color.black));
                JLabel duration=new JLabel(Language.getController().getLangValue("UpdateSessionPanel.LectureDuration"));
                durationBox=new JComboBox();
                for(int i=1;i<=24;i++)
        		durationBox.addItem(Integer.toString(i)+Language.getController().getLangValue("UpdateSessionPanel.LectureHour"));
                JLabel repeat=new JLabel("<html>&nbsp<font color=black>"+Language.getController().getLangValue("UpdateSessionPanel.LectureRepeat")+"</font></html>");
                repeatBox=new JComboBox();
                repeat_for_timeBox=new JComboBox();
                repeatBox.addActionListener(new ActionListener(){
                	public void actionPerformed(ActionEvent er){
                        	if(((String)repeatBox.getSelectedItem()).equals("No")){
                                	repeat_for_timeBox.setEnabled(false);
				}
                                else{
                                	repeat_for_timeBox.setEnabled(true);
				}
			}
		});
	
                JLabel repeat_for_time=new JLabel("<html>&nbsp<font color=black>"+Language.getController().getLangValue("UpdateSessionPanel.LectureRepeatForTime")+"</font></html>");
                try{
                        repeatBox.removeAllItems();
                }catch(Exception e){}
                repeatBox.addItem(Language.getController().getLangValue("UpdateSessionPanel.RepeatBox1"));
                repeatBox.addItem(Language.getController().getLangValue("UpdateSessionPanel.RepeatBox2"));
                repeatBox.addItem(Language.getController().getLangValue("UpdateSessionPanel.RepeatBox3"));
                repeatBox.addItem(Language.getController().getLangValue("UpdateSessionPanel.RepeatBox4"));
                try{
                        repeat_for_timeBox.removeAllItems();
                }catch(Exception e){}
                repeat_for_timeBox.addItem(Language.getController().getLangValue("UpdateSessionPanel.TimeBox1"));
                repeat_for_timeBox.addItem(Language.getController().getLangValue("UpdateSessionPanel.TimeBox2"));
                repeat_for_timeBox.addItem(Language.getController().getLangValue("UpdateSessionPanel.TimeBox3"));
                repeat_for_timeBox.addItem(Language.getController().getLangValue("UpdateSessionPanel.TimeBox4"));
                repeat_for_timeBox.setEnabled(false);
		
		ClassLoader clr= this.getClass().getClassLoader();	
		closeLabel=new JLabel(new ImageIcon(clr.getResource("resources/images/close.jpg")));
                closeLabel.addMouseListener(this);
                closeLabel.setName("closeLabel.Action");
                closeLabel.addMouseListener(this);
                annBttn=new JButton("<html><u><b><center><font color=blue>"+Language.getController().getLangValue("UpdateSessionPanel.UpdateBttn")+"</font></center></b></u>");
		annBttn.addActionListener(this);
                south_Panel.add(duration);
                south_Panel.add(durationBox);
                south_Panel.add(new JLabel("      "));
                south_Panel.add(annBttn);
                south_Panel.add(new JLabel("      "));
                south_Panel.add(closeLabel);
                return south_Panel;
	}

	/**
	 * Get Lecture Values from  Announce Session Panel.
	 */
			
	private String getLectureValues(){
	
	String phone_no = (String)phone_Text.getText();
		Pattern regex = Pattern.compile("\\d+");
		Matcher match = regex.matcher(phone_no); 
		if((lectName_Text.getText().equals(""))|| (urlText.getText().equals(""))||(lecInfoArea.getText().equals(""))||(endText.getText().equals(""))||(phone_Text.getText().equals(""))){
			JOptionPane.showMessageDialog(null,Language.getController().getLangValue("UpdateSessionPanel.MessageDialog1"));
                }
                else if(!match.matches()) 
              	{
                        JOptionPane.showMessageDialog(null,Language.getController().getLangValue("UpdateSessionPanel.MessageDialog7"));
                } 
                else{
			getTimeIndexingServer();
			DateUtil date=DateUtil.getController();
                        String st_year=(String)yearBox.getSelectedItem();
                        String st_month=(String)monthBox.getSelectedItem();
                        String st_day=(String)dayBox.getSelectedItem();
			
                        int curdate=Integer.parseInt(Integer.toString(year)+Integer.toString(month)+Integer.toString(day));
			int intforduedate=Integer.parseInt(st_year+Integer.parseInt(st_month)+st_day);
                        boolean check=date.checkDateInput(st_year,st_month,st_day);
                        if(intforduedate < curdate)
                        {
                                JOptionPane.showMessageDialog(null,Language.getController().getLangValue("UpdateSessionPanel.MessageDialog2"));

                                lectValue=null;
                                return lectValue.toString();
                        } else if((intforduedate >= curdate)&& check) {
                                String st_hour=(String)hourBox.getSelectedItem();
                                String st_minutes=(String)minBox.getSelectedItem();
				String st_hour_st_minutes=st_hour+":"+st_minutes;
                                if(intforduedate == curdate) {
                                        int totaltime=Integer.parseInt(st_hour)*60;
                                        totaltime=totaltime+Integer.parseInt(st_minutes);
					int cue_finaltime =(h*60)+m;	
                                        if(totaltime< cue_finaltime) {
                                                JOptionPane.showMessageDialog(null,Language.getController().getLangValue("UpdateSessionPanel.MessageDialog3"));
                                                lectValue=null;
                                                return lectValue.toString();
                                        }
                                }
				String courseName="";
				if(!((ClientObject.getCourseForAnnounce()).equals("")))
                                        courseName=ClientObject.getCourseForAnnounce();
				if(courseName.equals("--Show All--")){
                                        JOptionPane.showMessageDialog(null,Language.getController().getLangValue("UpdateSessionPanel.MessageDialog4"));
                                        lectValue=null;
                                        return lectValue;
                                }
				
				String st_duration=Integer.toString(durationBox.getSelectedIndex()+1)+":Hour";
				String vedeo="";					
                       	       	if(video.isSelected()==true){
					vedeo="1";
                       		}else{	
					vedeo="0";
				}
				String audio1="";
	                      	if(audio.isSelected()==true){
					audio1="1";
                            	}else{
					audio1="0";
                     		}
				String whiteboard1="1";
				if(whiteboard.isSelected()==true){
					whiteboard1="1";
        	               	}else{
					whiteboard1="0";
				}
				String mail_send1="1";
                                if(mail_send.isSelected()==true){
                                        mail_send1="1";
                                }else{
                                        mail_send1="0";
                                }
				
				try {
					if( (((String)lecInfoArea.getText()).length()<6) || (((String)lecInfoArea.getText()).length()> 50) )
                                	{
                                        	JOptionPane.showMessageDialog(null,Language.getController().getLangValue("AnnounceSessionPanel.MessageDialog6"));
                                        	return lectValue;
                                	}

                                	if( (((String)lectName_Text.getText()).length()<6) || (((String)lectName_Text.getText()).length()>50) )
	                                {
        	                                JOptionPane.showMessageDialog(null,Language.getController().getLangValue("AnnounceSessionPanel.MessageDialog4"));
                	                        return lectValue;
                        	        }
					lectValue = "&"+"lect_id="+URLEncoder.encode(lecture_id,"UTF-8");
                                        lectValue =lectValue+"&"+"lectGetParameter="+URLEncoder.encode("GetUpdateLectValues","UTF-8");
                                        lectValue =lectValue+"&"+ "lectUserName="+URLEncoder.encode(ClientObject.getUserName(),"UTF-8");
                                        lectValue =lectValue+"&"+"lectCouseName="+URLEncoder.encode(courseId,"UTF-8");
                                        lectValue =lectValue+"&"+"lectName="+URLEncoder.encode((String)lectName_Text.getText(),"UTF-8");
                                        lectValue =lectValue+"&"+"lectInfo="+URLEncoder.encode((String)lecInfoArea.getText(),"UTF-8");
                                        lectValue =lectValue+"&"+"lectNo="+URLEncoder.encode((String)phone_Text.getText(),"UTF-8");
                                        lectValue =lectValue+"&"+"lectDate="+URLEncoder.encode(st_year+"-"+st_month+"-"+st_day,"UTF-8");
                                        lectValue =lectValue+"&"+"lectTime="+URLEncoder.encode(st_hour_st_minutes,"UTF-8");
                                        lectValue =lectValue+"&"+"lectDuration="+URLEncoder.encode(st_duration,"UTF-8");
                                        lectValue =lectValue+"&"+"lectAudio="+URLEncoder.encode(audio1,"UTF-8");
                                        lectValue =lectValue+"&"+"lectVedio="+URLEncoder.encode(vedeo,"UTF-8");
                                        lectValue =lectValue+"&"+"lectWhiteBoard="+URLEncoder.encode(whiteboard1,"UTF-8");
                                        lectValue =lectValue+"&"+"lectmail_send="+URLEncoder.encode(mail_send1,"UTF-8");
                                } catch(Exception es){}
			}//if
            	}//else
		return lectValue;
     	}

	/**
	 * If user press the Announce button then announce a new Session.
      	 */
	public void actionPerformed(ActionEvent e){
        	if(e.getSource()==annBttn){
			StatusPanel.getController().setProcessBar("no");
			try {
				annBttn.setCursor(busyCursor);
				String lectValue = getLectureValues();
                                String indexServerName=ClientObject.getIndexServerName();
                                if(!(indexServerName.equals(""))) {
                                        String  indexServer=indexServerName+"/ProcessRequest?req=putLecture&"+lectValue;
                                        if(HttpsUtil.getIndexingMessage(indexServer)) {
						/********************* modified ******************************/
                                                JOptionPane.showMessageDialog(null,Language.getController().getLangValue("UpdateSessionPanel.MessageDialog5"));	
                                                StatusPanel.getController().setStatus(Language.getController().getLangValue("UpdateSessionPanel.MessageDialog5"));					      		
	                 			frame.dispose();
						//guiworker task = new guiworker();
						//task.execute();     
						task = new Task();
                        			task.addPropertyChangeListener(this);
                        			task.execute();
                                          }else
                                          	JOptionPane.showMessageDialog(null,Language.getController().getLangValue("UpdateSessionPanel.MessageDialog6"));
                                 }
                                  else{
					System.out.println("insufficient indexServer name in UpdateSession :" + indexServerName);
                                //annBttn.setCursor(defaultCursor);
			} }catch(Exception ex){log.setLog("Error at actionPerformed()in UpdateSessionPanel"+ex.getMessage());}
			StatusPanel.getController().setProcessBar("no");
		annBttn.setCursor(defaultCursor);
		}//if
     	}

 	/**
         * Action for mouse click in Announce Session Panel.
         */

	public void mouseClicked(MouseEvent ev) {
        	if(ev.getComponent().getName().equals("")){ }
		if(ev.getComponent().getName().equals("closeLabel.Action")) {
			StatusPanel.getController().setProcessBar("no");
			closeLabel.setCursor(busyCursor);
			try{
				Thread.sleep(500);
			}catch(InterruptedException ie){
				closeLabel.setCursor(defaultCursor);
			}finally{
				closeLabel.setCursor(defaultCursor);
			}
                  	frame.dispose();
			StatusPanel.getController().setProcessBar("no");
                }
	}
	
	public void propertyChange(PropertyChangeEvent evt) {
                        if ("progress" == evt.getPropertyName()) {
                                int progress = (Integer) evt.getNewValue();
                                progressBar.setValue(progress);
                                taskOutput.append(String.format("Completed %d%% of task.\n",task.getProgress()));
                        }
        }


	public void mousePressed(MouseEvent e) {}
        public void mouseReleased(MouseEvent e) {}
        public void mouseEntered(MouseEvent e) {}
        public void mouseExited(MouseEvent e) {}
	
        public class Task extends SwingWorker<Boolean,Void> implements PropertyChangeListener{
                	JFrame progressframe = new JFrame("Please Wait....");
                        Task(){
				/*
                        	Dimension dim=Toolkit.getDefaultToolkit().getScreenSize();
                        	ImageIcon loading = new ImageIcon(clr.getResource("resources/images/user/LoadingProgressBar.gif"));
                        	processframe.add(new JLabel("Loading .....",loading, JLabel.CENTER));
                        	processframe.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
                        	processframe.setSize(355,100);
                        	processframe.setVisible(true);
                        	processframe.setLocation((((int)dim.getWidth()/2)-102),((int)dim.getHeight()/2)+100);
				*/
				progressframe.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
                                progressframe.setSize(355,100);
                                progressframe.setVisible(true);
                                Dimension dim=Toolkit.getDefaultToolkit().getScreenSize();
                                progressframe.setLocation((((int)dim.getWidth()/2)-102),((int)dim.getHeight()/2)+100);
                                progressBar = new JProgressBar(0, 100);
                                progressBar.setValue(0);
                                progressBar.setStringPainted(true);
                                taskOutput = new JTextArea(5, 20);
                                taskOutput.setMargin(new Insets(5,5,5,5));
                                taskOutput.setEditable(false);
                                JPanel panel = new JPanel();
                                panel.add(progressBar);
                                progressframe.add(panel, BorderLayout.PAGE_START);
                                progressframe.add(new JScrollPane(taskOutput), BorderLayout.CENTER);
                                //setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
                	}
     
		protected  Boolean doInBackground() throws Exception {
				Random random = new Random();
                                int progress = 0;
                                setProgress(0);
                                while (progress < 100) {
				Thread.sleep(random.nextInt(1000));
                                progress += random.nextInt(10);
				setProgress(Math.min(progress, 100));
                                try{

				JScrollPane courselist = new JScrollPane();
				courselist= insCSPanel.showLecture(ClientObject.getSessionList(ClientObject.getInstCourseList(),ClientObject.getIndexServerName()));
				insCSPanel.getmainPanel().remove(1);
		        	try{
                        		insCSPanel.getmainPanel().add(courselist,BorderLayout.CENTER);
				}catch(Exception e) { System.out.println(e.getMessage());}
                	        insCSPanel.getmainPanel().revalidate();
                        	insCSPanel.getinstCourseCombo().setSelectedItem("--Show All--");
				return true;
				} catch(Exception ex){ System.out.println("Exception in Reload Action "+this.getClass()+" "+ex.getMessage());  }
                        } return false;
                }

	 	protected void done(){
				taskOutput.append("Done!\n");
                                boolean status = false;
	 			try{
	 				 status = get();
	 			}catch(Exception e) { System.out.println(e.getMessage());}
	 			if(status)
                        	progressframe.dispose();
     		}
	
		public void propertyChange(PropertyChangeEvent evt) {
                        if ("progress" == evt.getPropertyName()) {
                                int progress = (Integer) evt.getNewValue();
                                progressBar.setValue(progress);
                                taskOutput.append(String.format("Completed %d%% of task.\n",task.getProgress()));
                        }
                }

	}
	
	private void getTimeIndexingServer() {
                try {
  			String indexServer=org.bss.brihaspatisync.http.HttpCommManager.getTimeIndexingServer();
                        if(indexServer != null) {
				indexServer=java.net.URLDecoder.decode(indexServer.trim());
                                indexServer=indexServer.replace("date","");
                                String str[]=indexServer.split(" ");
                                String str1[]=str[0].split("/");

                                year=Integer.parseInt(str1[0]);
                                month=Integer.parseInt(str1[1]);
                                day=Integer.parseInt(str1[2]);

                                String str2[]=str[1].split(":");
                                h=Integer.parseInt(str2[0]);
                                m=Integer.parseInt(str2[1])+10;
                        }
                }catch(Exception e){ System.out.println("Error in getTimeIndexingServer() "+e.getMessage());}
        }
	
	private String decrypt(String encryptedData) throws Exception {
		String decryptedValue = new String(org.apache.commons.codec.binary.Base64.decodeBase64(encryptedData.getBytes()));
                return decryptedValue;
        }
}//end of class
