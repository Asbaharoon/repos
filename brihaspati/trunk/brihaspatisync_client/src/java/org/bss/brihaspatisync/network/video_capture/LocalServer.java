package org.bss.brihaspatisync.network.video_capture; 
/**
 * LocalServer.java
 *
 * See LICENCE file for usage and redistribution terms
 * Copyright (c) 2011,2013, ETRG, IIT Kanpur.
 */

import javax.imageio.ImageIO;
import java.io.ByteArrayInputStream;
import java.awt.image.BufferedImage;


import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;                                                                                                                            
import org.apache.commons.httpclient.methods.GetMethod;

import org.bss.brihaspatisync.util.ClientObject;
import org.bss.brihaspatisync.gui.VideoPanel;
import org.bss.brihaspatisync.gui.JoinSessionPanel;

import org.bss.brihaspatisync.util.RuntimeDataObject;
import org.bss.brihaspatisync.util.ThreadController;

import org.apache.commons.httpclient.auth.AuthScope;

import org.apache.commons.httpclient.Credentials;
import org.apache.commons.httpclient.HostConfiguration;
import org.apache.commons.httpclient.UsernamePasswordCredentials;


/**
 * @author <a href="mailto: arvindjss17@gmail.com" > Arvind Pal </a>
 * @author <a href="mailto: ashish.knp@gmail.com" > Ashish Yadav</a>
 * @author <a href="mailto: pradeepmca30@gmail.com" > Pradeep Kumar Pal</a>
 */

public class LocalServer implements Runnable {
	
	private static LocalServer get_capture=null;
	
	private Thread runner=null;
	private boolean flag=false;
	private VLCCapture grabber=null;
	private WindowsCamera w_grabber=null;
	private HttpClient client=null;
	private String os=System.getProperty("os.name");
	private RuntimeDataObject runtime_object=RuntimeDataObject.getController();

	public static LocalServer getController(){
                if(get_capture==null)
                        get_capture=new LocalServer();
                return get_capture;
        }

	public  LocalServer(){ }

	/**
         * Start TCPSender Thread.
         */
        public void startLocalServer(){	
		if (runner == null) {
			if((os.startsWith("Linux")) || (os.startsWith("MAC"))) 	
				grabber=new VLCCapture(600,400);
			else
				w_grabber=new WindowsCamera(600);
			flag=true;
                        runner = new Thread(this);
                        runner.start();
			System.out.println("Video Captureing start sucessfully !!");
		}
        }

        /**
         * Stop TCPSender Thread.
         */
        public void stopLocalServer() {
                if (runner != null) {
			flag=false;
                        runner = null;
			if (grabber != null) 
				grabber.close();
			//if (w_grabber != null)
                        //        w_grabber.close();
			grabber=null;
			System.out.println("Video Captureing  stop Successfully !!");
                }
        }

	/**
 	 * This method is used to get video from localmachine .
 	 * and put the image in buffer .
 	 */
	public void run() {
		while(flag && ThreadController.getThreadFlag()) {
		        try {
				if(ThreadController.getReflectorStatusThreadFlag()) {
					String ip=runtime_object.getVideoServer();
					BufferedImage image=null;
				        if((os.startsWith("Windows")) || (!(ip.equals("127.0.0.1")))) {
						image=w_grabber.grab();
						if(image==null) {
							HttpMethod method= new GetMethod("http://"+runtime_object.getVideoServer()+":"+runtime_object.getVideoServerPort());
							if(client ==null)
								client = new HttpClient();
						        client.setConnectionTimeout(80000);
                        			        method.setRequestHeader("Content-type","image/jpeg; charset=ISO-8859-1");
		                        	       	client.executeMethod(method);
	        		                	byte[] bytes=method.getResponseBody();
	        	                	        image = ImageIO.read(new ByteArrayInputStream(bytes));
			                	       	method.releaseConnection();
						}
					} else if((os.startsWith("Linux")) || (os.startsWith("MAC"))) {
						if(grabber == null) {
							//String cap_device=null;
					                //if(os.startsWith("Windows"))
					                //        cap_device="dshow://";
					                //if(os.startsWith("Linux"))
					                //        cap_device="v4l2:///dev/video0";
					                //if(os.startsWith("MAC"));
					                //        cap_device="qtcapture://";
					                //grabber=new VLCCapture(600,400);			
						}
						image=grabber.grab();
					}
					if(image != null) {
                                        	BufferImage.getController().handleBuffer();
                                                BufferImage.getController().put(image);
                                                if((ClientObject.getUserRole()).equals("instructor")) 
                                                	VideoPanel.getController().runInstructorVidio(image);
                                              	else  
                                               		VideoPanel.getController().runStudentVidio(image);
                                    	}   
                                        runner.yield(); runner.sleep(3000);
				} else
					runner.yield(); runner.sleep(3000);
			} catch(Exception e) { }
		}
		try {
			stopLocalServer();
                }catch(Exception e){}
	}
}
