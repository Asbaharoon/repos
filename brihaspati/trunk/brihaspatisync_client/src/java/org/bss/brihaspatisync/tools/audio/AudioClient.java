package org.bss.brihaspatisync.tools.audio;

/**
 * AudioClient.java
 * 
 * See LICENCE file for usage and redistribution terms
 * Copyright (c) 2012 ETRG,IIT Kanpur.
 */

import java.util.LinkedList;

import org.bss.brihaspatisync.gui.StatusPanel;
import org.bss.brihaspatisync.util.ThreadController;
import org.bss.brihaspatisync.util.RuntimeDataObject;
import org.bss.brihaspatisync.network.util.UtilObject;

/**
 * @author <a href="mailto:ashish.knp@gmail.com">Ashish Yadav </a>Created on Oct2011.
 * @author <a href="mailto:arvindjss17@gmail.com">Arvind Pal </a>Modified transmit thread.
 */

public class AudioClient implements Runnable {

	private Thread runner=null;
	private boolean flag=false;
	private boolean audiostartstopFlag=false;
	private static AudioClient audio=null;
	private AudioCapture au_cap=new AudioCapture();	
	private UtilObject utilobject=UtilObject.getController();
	private RuntimeDataObject runtime_object=RuntimeDataObject.getController();
	private org.xiph.speex.SpeexEncoder encoder=org.bss.brihaspatisync.util.AudioUtilObject.getSpeexEncoder();
	
	/**
 	 * Controller for the class.
 	 */
	public static AudioClient getController(){
		if(audio==null)
			audio=new AudioClient();
		return audio;
	}

	/**
 	 * Start Thread
 	 */
	public void startThread(){
        	if (runner == null) {
			flag=true;
            		runner = new Thread(this);
            		runner.start();
			StatusPanel.getController().setaudioClient("yes");
			org.bss.brihaspatisync.network.singleport.SinglePortClient.getController().addType("Audio_Data");
			System.out.println("AudioClient start successfully !!");
		}
       }

       /**
        * Stop Thread.
        */
	public void stopThread() {
        	if (runner != null) {
			flag=false;
            		runner.stop();
            		runner = null;	
			StatusPanel.getController().setaudioClient("no");
			org.bss.brihaspatisync.network.singleport.SinglePortClient.getController().removeType("Audio_Data");	
			System.out.println("AudioClient stop successfully !!");
      		}
   	}

	/**
	 * This flag is used to AudioCapture start/stop thread .
	 */   
	public void postAudio(boolean startstopflag) {
		audiostartstopFlag=startstopflag;
		au_cap.setflag(startstopflag);	
	}

	/**
 	 * Transmit audioInputStream to reflector by using HTTP post method.
 	 */
		
  	public void run() {
		while(flag && ThreadController.getController().getThreadFlag()) {
			try {
				if(ThreadController.getController().getReflectorStatusThreadFlag()) {
					/****   send audio data to reflector ****/
					if(audiostartstopFlag) {
						byte [] audiodata=au_cap.getAudioData();
						if(audiodata != null) {
							byte[] encoded_data=getEncoder(audiodata);
                        	                	LinkedList send_queue=utilobject.getSendQueue("Audio_Data");
	                		                send_queue.addLast(encoded_data);
						} 
					}
					/****   receive the audio data from reflector **********/
                        	        LinkedList audio_rechive_data=utilobject.getQueue("Audio_Data");
                                	if(audio_rechive_data.size()>0) {
                				byte[] audioBytes=(byte[])audio_rechive_data.get(0);
	                                        audio_rechive_data.remove(0);			
        	        	              	if((audioBytes.length) > 10) {
                	        	              	AudioPlayer.getController().putAudioStream(audioBytes);
						}
					}
					StatusPanel.getController().setaudioClient("yes");
				} else
					StatusPanel.getController().setaudioClient("no");
				runner.sleep(10);
				runner.yield();
			} catch(Exception epe) { 
				StatusPanel.getController().setaudioClient("no"); 	
				System.out.println("Exception in AudioClient class  "+epe.getMessage()); 
			}
        	}
	}
	
	/**
	 * This method is used to encode raw audio data.  
	 */ 
	private byte [] getEncoder(byte [] audiodata) {
		byte[] encoded_data= null;
		try {
			if(encoder.processData(audiodata, 0, audiodata.length)) {
				encoded_data= new byte[encoder.getProcessedDataByteSize()];
				encoder.getProcessedData(encoded_data, 0);
			}
		} catch(Exception e) { System.out.println("Exception in AudioClient class in getEncoder method ! "+e.getMessage());}
		return encoded_data;
	} 
}
