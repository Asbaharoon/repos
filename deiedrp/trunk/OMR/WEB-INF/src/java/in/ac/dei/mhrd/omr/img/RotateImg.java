/*
 * @(#) RotateImg.java
 * Copyright (c) 2011 EdRP, Dayalbagh Educational Institute.
 * All Rights Reserved.
 *
 * Redistribution and use in source and binary forms, with or
 * without modification, are permitted provided that the following
 * conditions are met:
 *
 * Redistributions of source code must retain the above copyright
 * notice, this  list of conditions and the following disclaimer.
 *
 * Redistribution in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in
 * the documentation and/or other materials provided with the
 * distribution.
 *
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL ETRG OR ITS CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL,SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Contributors: Members of EdRP, Dayalbagh Educational Institute
 */


package in.ac.dei.mhrd.omr.img;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

import ij.ImagePlus;

import ij.plugin.BMP_Writer;
import in.ac.dei.mhrd.omr.dbConnection.Connect;
import in.ac.dei.mhrd.omr.processSheet.ProcessSheetAction;
import java.io.*;
import in.ac.dei.mhrd.omr.resultProcess.ResultProcessAction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.*;

import org.apache.log4j.Logger;



/**
 * This class skew the tilted image and then process the image further
 * Creation Date: 05-05-2010
 * @Author Anshul Agarwal
 * @version 1.0
 * 
 */
public class RotateImg {
	
	private static Logger log = Logger.getLogger(RotateImg.class);
	private final int totalBlocks=46; // total blocks(white and black) 
    public static boolean flag=false;

	public  static ArrayList<String> AnsList; 
    public static ArrayList<Coordinates> leftBlocks; // coordinates of left
														// block
    public static ArrayList<Coordinates> RightBlocks; // coordinates of right
														// blocks
    static ImagePlus implus;
   static ij.process.ImageProcessor ip;
   static int xstartL; // starting point of processing in x dir. for left
						// blocks
   static int xendL; // ending point of processing in x dir. for left blocks
   static int xstartR; // starting point of processing in x dir. for right
						// blocks
   static int xendR; // ending point of processing in x dir. for left blocks
   static int noOfQues; // NO OF QUES IN EACH SECTION
                        /* sum of x coordinates of blocks on left side */
   static float xLtotal = 0;

    /* sum of y coordinates of blocks on left side */
   static float yLtotal = 0;

    /* x and y average of left side block */
   static float[] xyLeftAvg = new float[2];

    /* x and y average of right side block */
   static float[] xyRtAvg = new float[2];

    /* sum of x coordinates of blocks on right side */
   static float xRtotal = 0;

    /* sum of y coordinates of blocks on right side */
   static float yRtotal = 0;
   static byte[] attemptAns;
  public static byte[] correctAns; // CORRECT ANSWERS IN EACH SECTION
   
   public static boolean infoFlag=true;

    /**
	 * This function accepts object of imageProcessor class and rotate the image if
	 * required
	 */
    private void rotateImg(ij.process.ImageProcessor ip) {
        float xdiff;
        float ydiff;
        double angle;
        xstartL = (int) (ip.getWidth() * 0.8) / 100;
  //      xstartL = (int) (ip.getWidth() * 3) / 100; 
                                                    /*
													 * starting point of
													 * processing in x dir. for
													 * left blocks
													 */
        xendL = (int) (ip.getWidth() * 12) / 100; 
       // xendL = (int) (ip.getWidth() * 10) / 100;
                                                    // ending point of
													// processing in x dir. for
													// left blocks.

      
        xstartR = (int) (ip.getWidth() * 91) / 100; // starting point of
													// processing in x dir. for
													// right blocks

        xendR = ip.getWidth(); // ending point of processing in x dir. for left
								// blocks

        /*
		 * computes the coordinates of left side blocks, accept image object, x
		 * coordinate of starting point and ending point of processing
		 */

        leftBlocks = Coordinates.computeCorners(ip, xstartL, xendL);

        if(leftBlocks.size()!=totalBlocks){
        	flag=true;
        	log.error("blocks not found");
        	return;
        }
        
        
        computeAvg(leftBlocks, xyLeftAvg, xLtotal, yLtotal); // computes the
																// average of
																// coordinates
																// of leftside
																// blocks
       

        /*
		 * computes the coordinates of right side blocks, accept image object, x
		 * coordinate of starting point and ending point of processing
		 */

        RightBlocks = Coordinates.computeCorners(ip, xstartR, xendR);
        if(RightBlocks.size()!=totalBlocks){
        	flag=true;
        	log.error("blocks not found");
        	return;
        }
        computeAvg(RightBlocks, xyRtAvg, xRtotal, yRtotal); // computes the
															// average of
															// coordinates of
															// rightside blocks

        xdiff = xyRtAvg[0] - xyLeftAvg[0]; /*
											 * difference b/w the avg of x
											 * coordinates on the left side and
											 * the right side
											 */

        ydiff = xyLeftAvg[1] - xyRtAvg[1];  /*
											 * difference between the average of
											 * y coordinates on the leftside and
											 * right side blocks
											 */


        /* compute angle of rotation in radians */
        angle = (double) Math.atan2(ydiff, xdiff);

        /* convert the angle of rotation to degrees & rotate the image */
        ip.rotate(Math.toDegrees(angle));

        // System.out.println(" lft block after rotation");
        leftBlocks = Coordinates.computeCorners(ip, xstartL, xendL);
        if(leftBlocks.size()!=totalBlocks){
        	flag=true;
        	log.error("blocks not found");
        	return;
        }
        computeAvg(leftBlocks, xyLeftAvg, xLtotal, yLtotal);

        // System.out.println("Right block aftr rotation");
        RightBlocks = Coordinates.computeCorners(ip, xstartR, xendR);
        if(RightBlocks.size()!=totalBlocks){
        	flag=true;
        	log.error("blocks not found");
        	return;
        }
       
        
        computeAvg(RightBlocks, xyRtAvg, xRtotal, yRtotal);
        ydiff = xyLeftAvg[1] - xyRtAvg[1]; // difference between the average of
											// y coordinates on the leftside and
											// right side blocks

    }

    /**
	 * This method process the correct answer sheet
	 * 
	 * @param str
	 *            :path of the image
	 * @throws IOException
	 */
    public synchronized byte[] processCorrectSheet(String str, int testid, int noOfQues) throws IOException {
    	correctAns = new byte[noOfQues+1];
    	int xend=0;
    	implus = new ImagePlus(str);
        
        ip = implus.getChannelProcessor(); // loads the image

        ip.dilate(); // to fill the gaps in the marked circles
     ip.dilate();  

        
        rotateImg(ip);
       
        if(!flag){

        // "leftBlocks" contains the top and bottom coordinates of each block on
		// the left side

        // stores the mid point of the left & right side blocks in arraylist
        ArrayList<MidPoint> ansDetail_mpLeft = MidPoint.compute_block_midPoint(leftBlocks,
                11, leftBlocks.size() - 1, ip); // other sheets
        ArrayList<MidPoint> ansDetail_mpRight = MidPoint.compute_block_midPoint(RightBlocks,
                11, RightBlocks.size() - 1, ip); // other sheets
        ip.erode();
        ip.erode(); /* to erode the unfilled circles & othet text */
        ip.erode();

        ip.dilate(); // to make the marks visible
         ip.erode();
         ip.erode();
         
        // System.out.println("Height of image == "+ip.getHeight());
       //  System.out.println("Width of image == "+ip.getWidth());
         
         if(noOfQues<=30){
       	   xend=(int) (ip.getWidth()*29)/100;
          }else
       	   if(noOfQues<=60){

           	   xend=(int) (ip.getWidth()*52)/100;
              }else
           	   if(noOfQues<=90){

               	   xend=(int) (ip.getWidth()*75)/100;

           	   }else
           	        if(noOfQues<=120){
               	   xend=(int) (ip.getWidth()*94)/100;
                   }

         
        /*
		 * This method returns the correct answers
		 */
        correctAns = CirclePosition.getAns(ip, ansDetail_mpLeft,
                ansDetail_mpRight, xyRtAvg[0], xyLeftAvg[0],
                (int) (ip.getWidth() * 7) / 100,
                xend, noOfQues);
        }
    /* try { 
			  Image img = implus.getImage();
			   implus.updateChannelAndDraw();
		  implus.show();
		  
		  BMP_Writer bw = new BMP_Writer();
		  
		  bw.run("");
		 
		 // bw.saveBitmap("C:/bmpImg.bmp", img, 3000, 2400);
		  } catch (Exception
		  e) { log.error("Exception : " + e); }*/
		

        return correctAns;
    }

    public ArrayList<String> convertToString(byte[] correctAns ){
    	
    	ArrayList<String> AnsList = new ArrayList<String>(correctAns.length);
    	for(int i=0;i<correctAns.length;i++){
    		
    		switch(correctAns[i]){
    		case 1:
    			   AnsList.add("A");
    			   break;
    		case 2:
    			  AnsList.add("B");
    	          break;
    		case 4:
    			
    			AnsList.add("C");
    			break;
    		case 8:
    			AnsList.add("D");
    			break;
    		case 3:
 			   AnsList.add("A+B");
 			   
 			   break;
 		case 5:
 			  AnsList.add("A+C");
 	          break;
 		case 6:
 			AnsList.add("B+C");
 			break;
 		case 7:
 			AnsList.add("A+B+C");
 			break;
 		case 9:
			   AnsList.add("A+D");
			   break;
		case 10:
			  AnsList.add(i,"B+D");
	          break;
		case 11:
			AnsList.add("A+B+D");
			break;
		case 12:
			AnsList.add("D+C");
			break;
		case 13:
			AnsList.add("A+C+D");
			break;
		case 14:
			AnsList.add("B+C+D");
			break;
		case 15:	
		     AnsList.add("A+B+C+D");
		     break;
		    default:
		    	AnsList.add("x");
		 		    			
    		
    		}
    		
    	}
    	
    	return AnsList;
    }
    /**
     * This method process the response sheets of the candidate
     * @param str
     * @param testid
     * @param noOfQues
     */
    
    public synchronized void processSheet(String imgPath, int testid, int noOfQues, String rejectedFolder, String instructorTestNo) {
        String rno="-1"; // holds the rno no. obtained after processing the sheet
        
        Locale obj = new Locale("en", "US");
		ResourceBundle message = ResourceBundle.getBundle("in//ac//dei//mhrd//omr//ApplicationResources", obj);
       int xend=0;
        attemptAns = new byte[noOfQues+1]; 
        String fileName = new File(imgPath).getName();
        String dir  = new File(imgPath).getParent();
  	  File source = new File(dir, fileName);
               try {
            	   System.out.println("processSheet");
        	
            implus = new ImagePlus(imgPath);

            ip = implus.getChannelProcessor(); // load the image
            
        } catch (Exception e) {
           log.error("error in loading mage");
           LogEntry.insert_Log(testid, fileName,
    	            message.getString("code.E108"), message.getString("msg.E108"));
    	  log.info(message.getString("msg.E108"));

	        boolean flag = source.renameTo(new File (ProcessSheetAction.RejectedFolderPath, fileName));
	        log.info("filer move to rejected folder in ext " + flag);
        
           return;
        }

        ip.dilate(); // to fill the gaps in the marked circles
        ip.dilate();
      //  ip.erode(); // to remove the extra boundary pixels add during dilation

        
        rotateImg(ip); // rotate to correct the tilt

        if(flag){
        	LogEntry.insert_Log(testid, fileName,
     	            message.getString("code.E109"), message.getString("msg.E109"));
     	  log.info(message.getString("msg.E109"));

 	        boolean flag1 = source.renameTo(new File (ProcessSheetAction.RejectedFolderPath, fileName));
 	        log.info("filer move to rejected folder in ext " + flag1);
         flag=false;
            return;
	    }

        
        /*
		 * stores the mid points of the blocks in the student info. part of the
		 * sheet(first 10 blocks)
		 */
        ArrayList<MidPoint> studentDetail_mpLeft = MidPoint.compute_block_midPoint(leftBlocks,
                1, 10, ip); // other sheets
        ArrayList<MidPoint> studentDetail_mpRight = MidPoint.compute_block_midPoint(RightBlocks,
                1, 10, ip); // other sheets

        /*
		 * stores the coordinates of mid point of the blocks in left & right
		 * side of the sheet(last 13 blocks)
		 */
       
        ArrayList<MidPoint> ansDetail_mpLeft = MidPoint.compute_block_midPoint(leftBlocks,
                11, leftBlocks.size() - 1, ip); // other sheets
        ArrayList<MidPoint> ansDetail_mpRight = MidPoint.compute_block_midPoint(RightBlocks,
                11, RightBlocks.size() - 1, ip); // other sheets

        System.out.println("3");
        ip.erode();
        ip.erode(); /* to erode the unfilled circles & othet text */
        ip.erode();

        ip.dilate(); // to make the marks visible
         ip.erode();
         ip.erode();
        RotateImg.infoFlag=true;
        
        if(noOfQues<=30){
     	   xend=(int) (ip.getWidth()*29)/100;
        }else
     	   if(noOfQues<=60){
         	   xend=(int) (ip.getWidth()*52)/100;
            }else
         	   if(noOfQues<=90){
             	   xend=(int) (ip.getWidth()*75)/100;

         	   }else
         	   		if(noOfQues<=120){
             	   xend=(int) (ip.getWidth()*94)/100;

         	   }
            
        


        // This method returns the roll no of the candidate
        
        rno= CirclePosition.getCandidateInfo(ip, studentDetail_mpLeft,
                studentDetail_mpRight, (double)xyRtAvg[0], (double)xyLeftAvg[0],
                (int) (ip.getWidth() * 7) / 100,
                (int) (ip.getWidth() * 93) / 100, imgPath, testid, instructorTestNo);
        
        if(rno=="-1"){
             	boolean flag = source.renameTo(new File (ProcessSheetAction.RejectedFolderPath, fileName));
             	log.info("filer move to rejected folder in ext " + flag);
             	flag=false;
             	return;
            }
        
        attemptAns = CirclePosition.getAns(ip, ansDetail_mpLeft,
                ansDetail_mpRight, xyRtAvg[0], xyLeftAvg[0],
                (int) (ip.getWidth() * 7) / 100, xend, noOfQues);
       // System.out.println("size of attempt" + attemptAns.length);
        Response.insert_response(attemptAns, testid,
                Integer.parseInt(rno), noOfQues, imgPath);
        //System.out.println("calling evaluate");
        evaluateSheet(Integer.parseInt(rno), testid, noOfQues, fileName);

       
		 /* try { 
			  Image img = implus.getImage(); implus.updateChannelAndDraw();
		  implus.show();
		  
		  BMP_Writer bw = new BMP_Writer();
		  
		  bw.run("");
		  
		 // bw.saveBitmap("C:/bmpImg.bmp", img, 3000, 2400);
		  } catch (Exception
		  e) { System.out.println("Exception : " + e); }
		*/ 
          implus.flush();
             
    }
    
  /**
   * This method computes the number of correct attempts, wrong attempts and unattempted 
   * questions and insert this information into the database
   * @param rno
   * @param testid
   * @param noOfQues
   * @param fileName
   */  
    
    private void evaluateSheet(int rno, int testid, int noOfQues, String fileName){
    	int[] correctAttempt=new int[5];
    	int[] wrongAttempt=new int[5];
    	for(int i=0; i<5;i++){
    		correctAttempt[i]=0;
    		wrongAttempt[i]=0;
    	}
    	int responseCounter;
    	int sectionNumber=1;
    	//System.out.println("rno" + rno + "testid" +testid + " ques " +noOfQues);
    	ResultSet correctAttRs=null;
    	ResultSet wrongAttRs = null;
    	ResultSet sectionDetailRs=null;
    	Connection con =null;
    	  try {
               con = Connect.prepareConnection();
              con.setAutoCommit(false);
             // System.out.println("inside eva");
              
              PreparedStatement ps = con.prepareStatement(
              "SELECT Section_number, No_of_question FROM testsectiondetail t where TestId=?");
              ps.setInt(1, testid);

              sectionDetailRs = ps.executeQuery();
                 
              ps = con.prepareStatement(
              "Select count(*), c.SectionNumber from correctans c, response r where ((c.Ques_no=r.ques_no)AND (c.TestId=?)AND (c.Answer = r.ans)AND(c.TestId=r.TestId)AND (r.RollNo=?) AND (r.FileName=?)AND (c.Ques_no NOT IN (select WrongQuestionNo from wrongquestion where TestId=?))) group by c.SectionNumber");
           ps.setInt(1, testid);
           ps.setInt(2, rno);
           ps.setString(3, fileName);
           ps.setInt(4, testid); 
      correctAttRs = ps.executeQuery();
     // System.out.println("Aftr exe corr");
     
      while(correctAttRs.next()){
    	  correctAttempt[correctAttRs.getInt(2)]= correctAttRs.getInt(1);
    	 
      }
      /*correctAttRs.next();
      System.out.println("correct Ans : " + correctAttRs.getInt(1));
      */
      ps = con.prepareStatement(
      "Select count(*), c.SectionNumber from correctans c, response r where ((c.Ques_no=r.ques_no)AND (c.TestId=?)AND (c.Answer != r.ans)AND(c.TestId=r.TestId)AND (r.RollNo=?) AND (r.FileName=?) AND (c.Ques_no NOT IN (select WrongQuestionNo from wrongquestion where TestId=?))) group by c.SectionNumber");
   ps.setInt(1, testid);
   ps.setInt(2, rno);
   ps.setString(3, fileName);
   ps.setInt(4,testid);
 wrongAttRs = ps.executeQuery();
 
 //System.out.println("After executing wrong");
 while(wrongAttRs.next()){
	  wrongAttempt[wrongAttRs.getInt(2)]= wrongAttRs.getInt(1);
	 // System.out.println(" wrong :  " + wrongAttRs.getInt(2) + " "+ wrongAttRs.getInt(1) + "  file : "+ fileName);
	 
	  
 }
 
   //wrongAttempt = rs.getInt(1); 
 
 

  
  /* System.out.println("correct Attempt : " + correctAttempt);
   System.out.println("wrong Attempt : " + wrongAttempt);
   System.out.println("unattempt : " + (noOfQues- (correctAttempt + wrongAttempt)));*/
    
// System.out.println("1");
 int secCount=1;
 while(sectionDetailRs.next()){
	 
	 
	// System.out.println("sec num : " + sectionDetailRs.getInt(1) + " ques : "+ sectionDetailRs.getInt(2) + " file : "+ fileName);
	// System.out.println("unatttempt :" + (sectionDetailRs.getInt(2)-(correctAttempt[secCount] + wrongAttempt[secCount])));
                ps = con.prepareStatement(
                          "insert into attempt_info(TestId, RollNo, Correct_attempt, Wrong_attempt, Unattempt, SectionNumber, FileName) values (?,?,?,?,?,?,?)");
                  ps.setInt(1, testid);
                  ps.setInt(2, rno);
                  ps.setInt(3, correctAttempt[secCount]);
                  ps.setInt(4, wrongAttempt[secCount]);
                  ps.setInt(5, (sectionDetailRs.getInt(2)-(correctAttempt[secCount] + wrongAttempt[secCount])));
                  ps.setInt(6, sectionDetailRs.getInt(1));
                  ps.setString(7, fileName);
                  ps.executeUpdate();
                  secCount++;
                 // sectionNumber++;
                  
                  PreparedStatement ps1  = con.prepareStatement(
                  "insert into student_result_info(TestId, RollNo, SectionNumber, FileName,group_code,section_marks,total_marks) values (?,?,?,?,?,?,?)");
       
			       	ps1.setInt(1, testid);
			           ps1.setInt(2, rno);
			           ps1.setInt(3, sectionDetailRs.getInt(1));
			           ps1.setString(4, fileName);
			           ps1.setString(5, "00");
			           ps1.setFloat(6, 0.0f);
			           ps1.setFloat(7, 0.0f);
			           
			           ps1.executeUpdate();
			       
   }
 con.commit();                 
          } catch (Exception e) {
             System.out.println("error while insert in attempt rotate img" + e);
          }
          finally{
        	  Connect.freeConnection(con);
          }

    }

  
    // ---------------------------compute Average of top left coordinates of
	// blocks-----------------------------//
    /**
	 * 
	 * @param Blocks
	 *            :contains the top left coordinates of each block
	 * @param XYAvg :
	 *            stores the x & y coordinate of each block
	 * @param xLtotal:
	 *            sum of x coordinate
	 * @param yLtotal:
	 *            sum of y coordinate
	 */
    private void computeAvg(ArrayList<Coordinates> Blocks, float[] XYAvg,
        float xtotal, float ytotal) {
        int i = 0;

        for (Coordinates obj : Blocks) {
            xtotal = xtotal + obj.x;
            ytotal = ytotal + obj.y;
            i++;

            // System.out.println("block : " + i + " y: " + obj.y + " ytotal " +
			// ytotal);
        } // end for

        XYAvg[0] = xtotal / Blocks.size();
        XYAvg[1] = ytotal / Blocks.size();

        // System.out.println("Avg" + XYAvg[1]);
    }
	
	
    /**
     * To get Group for correct Answer Sheets 
     * @param str
     * @param testid
     * @param countgroup
     * @return
     * @throws IOException
     */
    public synchronized String processSheetGroup(String str, int testid, int countgroup) throws IOException {
    	String groups=null;
    	implus = new ImagePlus(str);
        ip = implus.getChannelProcessor(); // loads the image
        ip.dilate(); // to fill the gaps in the marked circles
        ip.dilate();  

        rotateImg(ip);
        if(!flag){
        // "leftBlocks" contains the top and bottom coordinates of each block on
		// the left side
        // stores the mid point of the left & right side blocks in arraylist
        	 ArrayList<MidPoint> studentDetail_mpLeft = MidPoint.compute_block_midPoint(leftBlocks,
                     1, 10, ip); // other sheets
             ArrayList<MidPoint> studentDetail_mpRight = MidPoint.compute_block_midPoint(RightBlocks,
                     1, 10, ip); // other sheets
             ip.erode();
             ip.erode(); /* to erode the unfilled circles & othet text */
             ip.erode();
             ip.dilate(); // to make the marks visible
             ip.erode();
             ip.erode();
             groups= CirclePosition.getGroupInfo(ip, studentDetail_mpLeft,
                     studentDetail_mpRight, (double)xyRtAvg[0], (double)xyLeftAvg[0],
                     (int) (ip.getWidth() * 7) / 100,
                     (int) (ip.getWidth() * 93) / 100, countgroup);
             }
        return groups;
    }
    
    /**
     * Method to process Sheets
     * @param imgPath
     * @param testid
     * @param noOfQues
     * @param rejectedFolder
     * @param instructorTestNo
     * @param countGroup
     */
    public synchronized void processSheetDual(String imgPath, int testid, int noOfQues, String rejectedFolder, String instructorTestNo, int countGroup) 
    {
        String rno="-1"; // holds the roll no. obtained after processing the sheet
        Locale obj = new Locale("en", "US");
		ResourceBundle message = ResourceBundle.getBundle("in//ac//dei//mhrd//omr//ApplicationResources", obj);
		int xend=0;
        attemptAns = new byte[noOfQues+1]; 
        String fileName = new File(imgPath).getName();
        String dir  = new File(imgPath).getParent();
  	  	File source = new File(dir, fileName);
               try {
            	   implus = new ImagePlus(imgPath);
            	   ip = implus.getChannelProcessor(); // load the image
               } 
               catch (Exception e) 
               {
            	   log.error("error in loading image");
            	   LogEntry.insert_Log(testid, fileName,message.getString("code.E108"), message.getString("msg.E108"));
            	   log.info(message.getString("msg.E108"));
            	   boolean flag = source.renameTo(new File (ProcessSheetAction.RejectedFolderPath, fileName));
            	   log.info("filer move to rejected folder in ext " + flag);
                   return;
               }
               ip.dilate(); // to fill the gaps in the marked circles
               ip.dilate();
               //  ip.erode(); // to remove the extra boundary pixels add during dilation

               rotateImg(ip); // rotate to correct the tilt
               if(flag){
            	   log.info(message.getString("msg.E109"));
            	   boolean flag1 = source.renameTo(new File (ResultProcessAction.RejectedFolderPath, fileName));
            	   LogEntry.insert_Log(testid, fileName,message.getString("code.E109"), message.getString("msg.E109"));
            	   //	boolean flag = source.renameTo(new File (ProcessSheetAction.RejectedFolderPath, fileName));
            	   log.info("filer move to rejected folder in ext " + flag1);
            	   flag=false;
            	   return;
               }

               /*
                * stores the mid points of the blocks in the student info. part of the
                * sheet(first 10 blocks)
                */
               ArrayList<MidPoint> studentDetail_mpLeft = MidPoint.compute_block_midPoint(leftBlocks,1, 10, ip); // other sheets
               ArrayList<MidPoint> studentDetail_mpRight = MidPoint.compute_block_midPoint(RightBlocks,1, 10, ip); // other sheets

               /*
                * stores the coordinates of mid point of the blocks in left & right
                * side of the sheet(last 13 blocks)
                */
               ArrayList<MidPoint> ansDetail_mpLeft = MidPoint.compute_block_midPoint(leftBlocks,11, leftBlocks.size() - 1, ip); // other sheets
               ArrayList<MidPoint> ansDetail_mpRight = MidPoint.compute_block_midPoint(RightBlocks,11, RightBlocks.size() - 1, ip); // other sheets

               ip.erode();
               ip.erode(); /* to erode the unfilled circles & other text */
               ip.erode();
               ip.dilate(); // to make the marks visible
               ip.erode();
               ip.erode();
               
               RotateImg.infoFlag=true;
               if(noOfQues<=30){
            	   xend=(int) (ip.getWidth()*29)/100;
               }
               else if(noOfQues<=60){
            	   xend=(int) (ip.getWidth()*52)/100;
               }
               else if(noOfQues<=90){
        		   xend=(int) (ip.getWidth()*75)/100;
               }
               else if(noOfQues<=120){
        		   xend=(int) (ip.getWidth()*94)/100;
               }
     
               // This method returns the roll no of the candidate
               rno= CirclePosition.getCandidateInfoGroup(ip, studentDetail_mpLeft,
            		   studentDetail_mpRight, (double)xyRtAvg[0], (double)xyLeftAvg[0],
            		   (int) (ip.getWidth() * 7) / 100,
            		   (int) (ip.getWidth() * 93) / 100, imgPath, testid, instructorTestNo,countGroup);
        
               if(rno=="-1"){
            	   boolean flag = source.renameTo(new File (ResultProcessAction.RejectedFolderPath, fileName));
            	   log.info("file move to rejected folder in ext " + flag);
            	   flag=false;
            	   return;
               }
               attemptAns = CirclePosition.getAns(ip, ansDetail_mpLeft,
            		   ansDetail_mpRight, xyRtAvg[0], xyLeftAvg[0],
            		   (int) (ip.getWidth() * 7) / 100, xend, noOfQues);
     
               Response.insert_response(attemptAns, testid, Integer.parseInt(rno), noOfQues, imgPath);
               
               if(countGroup>0)
               {
            	   String	group= CirclePosition.getGroupCodes(ip, studentDetail_mpLeft,
                   studentDetail_mpRight, (double)xyRtAvg[0], (double)xyLeftAvg[0],
                   		(int) (ip.getWidth() * 7) / 100,
                   		(int) (ip.getWidth() * 93) / 100, imgPath, testid, instructorTestNo,countGroup);
            	   System.out.println("groupCodes  for rollnumber "+group+" "+rno);
            	   if(group=="-1"){
            		   boolean flag = source.renameTo(new File (ResultProcessAction.RejectedFolderPath, fileName));
            		   log.info("filer move to rejected folder in ext " + flag);
            		   flag=false;
            		   return;
            	   }
            	   boolean chk=validateGroupSheet(Integer.parseInt(rno), testid, noOfQues, fileName,group);
            	   if(chk){
            		   boolean flag = source.renameTo(new File (ResultProcessAction.RejectedFolderPath, fileName));
            		   log.info("filer move to rejected folder in ext " + flag);
            		   flag=false;
            		   return;
            	   }
            	   else evaluateGroupSheet(Integer.parseInt(rno), testid, noOfQues, fileName,group);
            	   
               }
               else  evaluateSheet(Integer.parseInt(rno), testid, noOfQues, fileName);
               implus.flush();
    }

    /**
     * To evaluate the group Sheet
     * @param rno
     * @param testid
     * @param noOfQues
     * @param fileName
     * @param group
     */
    private void evaluateGroupSheet(int rno, int testid, int noOfQues, String fileName, String group)
    {
    	int wrong=0;
    	int correct=0;
    	ResultSet sectionDetailRs=null;
    	ArrayList<String> aa=new ArrayList<String>();
    	ArrayList<String> bb=new ArrayList<String>();
    	for(int countvalue=0;countvalue<noOfQues;countvalue++){
    		bb.add(countvalue, "x");
    	}
    	ArrayList<Integer> misprint=new ArrayList<Integer>();
    	Connection con =null;
    	try {
    		con = Connect.prepareConnection();
            con.setAutoCommit(false);
            int j=0;
            int cnt=0;
            int next=0;
           
            PreparedStatement ps = con.prepareStatement("select WrongQuestionNo from wrongquestion where TestId=?");
            ps.setInt(1, testid);
            ResultSet rset=ps.executeQuery();
            while(rset.next()){
        	  	misprint.add(rset.getInt(1));
        	  	System.out.println("misprinted ques: "+misprint);
            }
            ps = con.prepareStatement("SELECT Section_number, No_of_question FROM testsectiondetail t where TestId=?");
            ps.setInt(1, testid);
            sectionDetailRs = ps.executeQuery();
            
            while(sectionDetailRs.next())
            {
            	  String grp=group.substring(j, j+2);
            	  System.out.println("group "+group.substring(j, j+2));
            	  System.out.println("section number "+sectionDetailRs.getInt(1)+" no of ques "+sectionDetailRs.getInt(2));
            	  
            	  ps = con.prepareStatement("SELECT ques_no,Answer FROM correctans where testid=? and sectionNumber=? and group_code=?");
                  ps.setInt(1, testid);
                  ps.setInt(2,sectionDetailRs.getInt(1) );
                  ps.setString(3,grp );
                  ResultSet rs=ps.executeQuery();

                  while(rs.next()){
                	  aa.add(rs.getString(2));
                  }
                  System.out.println("correct "+aa);
                 // System.out.println("RESPONSES");
                  ps = con.prepareStatement("SELECT ques_no,ans FROM response where testid=? and SectionNumber=? and Rollno=? and Filename=? ");
                  ps.setInt(1, testid);
                  ps.setInt(2,sectionDetailRs.getInt(1) );
                  ps.setInt(3, rno);
                  ps.setString(4, fileName);
                  
                  ResultSet rs1=ps.executeQuery();
                  while(rs1.next()){
                	  		bb.set((rs1.getInt(1)-1),rs1.getString(2));
                  }
                  next=next+sectionDetailRs.getInt(2);
             	  if(misprint.size()>0){
            		  for(int n=0;n<misprint.size();n++){
                  			if(misprint.get(n)<aa.size())
                  			{
                  				bb.set(misprint.get(n)-1, "x");
                  			}  
            		  }
                  }
                
            	  for(int m=cnt;m<next;m++){
            		   if(!(bb.get(m).equals("x"))){             		
            			  if(!(bb.get(m).equals(aa.get(m)))){
            				  wrong++;
              			  } 
            			  else{
            				  correct++;
            			  }
            	     }
            	  }
            	  ps = con.prepareStatement("insert into attempt_info(TestId, RollNo, Correct_attempt, Wrong_attempt, Unattempt, SectionNumber, FileName) values (?,?,?,?,?,?,?)");
            	  ps.setInt(1, testid);
            	  ps.setInt(2, rno);
            	  ps.setInt(3, correct);
            	  ps.setInt(4, wrong);
            	  ps.setInt(5, (sectionDetailRs.getInt(2)-( correct + wrong)));
            	  ps.setInt(6, sectionDetailRs.getInt(1));
            	  ps.setString(7, fileName);
            	  ps.executeUpdate();
              
            	  cnt=cnt+sectionDetailRs.getInt(2);
                  correct=0;
                  wrong=0;
              
                  /*-------------*/
                  ps = con.prepareStatement("insert into student_result_info(TestId, RollNo, SectionNumber, FileName,group_code,section_marks,total_marks) values (?,?,?,?,?,?,?)");
            	  ps.setInt(1, testid);
            	  ps.setInt(2, rno);
            	  ps.setInt(3, sectionDetailRs.getInt(1));
            	  ps.setString(4, fileName);
            	  ps.setString(5,grp );
            	  ps.setFloat(6,0.0f );
            	  ps.setFloat(7,0.0f );
            	  ps.executeUpdate();
                  
                  j=j+2;
             }
             con.commit();                 
    	} catch (Exception e) {
             System.out.println("error while insert in attempt rotate img " + e);
        }
        finally{
        	  Connect.freeConnection(con);
        }
    }
    /**
     * To validate that for each group code answer or inserted in CorrectAns table or not
     * @param rno
     * @param testid
     * @param noOfQues
     * @param fileName
     * @param group
     * @return
     */
    @SuppressWarnings("unchecked")
	private boolean validateGroupSheet(int rno, int testid, int noOfQues, String fileName, String group)
    {
    	Locale obj = new Locale("en", "US");
		ResourceBundle message = ResourceBundle.getBundle("in//ac//dei//mhrd//omr//ApplicationResources", obj);
    	int countCorrectAnswer=0;
    	int countResponse = 0;
    	boolean a=true;
    	ResultSet sectionDetailRs=null;
    	Connection con =null;
    	List<String> tempGroup=new ArrayList<String>();
    	try {
    		con = Connect.prepareConnection();
            con.setAutoCommit(false);
            int j=0;
            PreparedStatement ps = con.prepareStatement("SELECT Total_question FROM testheader where TestId=? ");
            ps.setInt(1, testid);
            ResultSet rs1=ps.executeQuery();
            rs1.next();
            countResponse=rs1.getInt(1);
            ps = con.prepareStatement("SELECT Section_number, No_of_question FROM testsectiondetail t where TestId=?");
            ps.setInt(1, testid);
            sectionDetailRs = ps.executeQuery();
            while(sectionDetailRs.next())
            {
            	  String grp=group.substring(j, j+2);
            	  tempGroup.add(grp);
            	  ps = con.prepareStatement("SELECT count(*) FROM correctans where testid=? and sectionNumber=? and group_code=?");
                  ps.setInt(1, testid);
                  ps.setInt(2,sectionDetailRs.getInt(1) );
                  ps.setString(3,grp );
                  ResultSet rs=ps.executeQuery();
                  rs.next();
                  countCorrectAnswer =countCorrectAnswer+ rs.getInt(1);
                  j=j+2;  
            }
            if(countCorrectAnswer==countResponse){
          	  	
            	//System.out.println("tempGroup "+tempGroup);
	           	HashSet set = new HashSet();
	          	for (int i = 0; i < tempGroup.size(); i++ ) 
	          	{	
	          		if(!set.add(tempGroup.get(i))){
	          			a= true;
	          			LogEntry.insert_Log(testid, fileName,message.getString("code.E111"), message.getString("msg.E111"));
	          			break;
	          		}
	          		else a= false;
	          		//System.out.println("here in for "+ a);
	          	}
          	}
            else{
            	LogEntry.insert_Log(testid, fileName,message.getString("code.E112"), message.getString("msg.E112"));
          	  	a=true;
          	}
            con.commit();                 
    	} 
    	catch (Exception e) {
             System.out.println("error while validate" + e);
        }
        finally{
        	Connect.freeConnection(con);
        }
		return a;
    }
}
