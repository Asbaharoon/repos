/* Original source which is modified resulting in this file, is copyrighted (c)
 * 2001-2002 by Alexander Shapiro in made available under the license as
 * reproduced below.
 *
 * TouchGraph LLC. Apache-Style Software License
 *
 *
 * Copyright (c) 2001-2002 Alexander Shapiro. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:
 *       "This product includes software developed by
 *        TouchGraph LLC (http://www.touchgraph.com/)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 4. The names "TouchGraph" or "TouchGraph LLC" must not be used to endorse
 *    or promote products derived from this software without prior written
 *    permission.  For written permission, please contact
 *    alex@touchgraph.com
 *
 * 5. Products derived from this software may not be called "TouchGraph",
 *    nor may "TouchGraph" appear in their name, without prior written
 *    permission of alex@touchgraph.com.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL TOUCHGRAPH OR ITS CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * ====================================================================
 * 
 * The changes done in the original source to suit our requirement are released
 * under the license as given in LICENSE file distributed with this source.
 * All such changes are Copyrighted (c) 2011-2012 ETRG, IIT Kanpur.
 */

package org.bss.brihaspatisync.monitor.graphlayout.interaction;

/**
 *  HyperScroll.java
 *  */


import  org.bss.brihaspatisync.monitor.graphlayout.*;
 
import  java.awt.event.*;
import java.awt.*;
//import  javax.swing.*;

/**
 *  @author <a href="mailto:shikhashuklaa.gmail.com">Shikha Shukla</a>
 *  @date 05/12/2011
 *      
 *  */


public class HyperScroll implements GraphListener {

    private Scrollbar hyperSB;
    private TGPanel tgPanel;
    HyperLens hyperLens;
    double inverseArray[]=new double[200]; //Helps calculate the inverse of the Hyperbolic function
    double width; //Initially was intended to change the function of the lens depending on screen size,
                  //but now functions as a constant.

    public HyperScroll(TGPanel tgp) {    
        tgPanel=tgp;
        hyperSB = new Scrollbar(Scrollbar.HORIZONTAL, 100, 8, 0, 108);
        hyperSB.addAdjustmentListener(new hyperAdjustmentListener());
        
        hyperLens = new HyperLens();
        width= 2000;//tgPanel.getSize().width/2;
        updateInverseArray();
        
        tgPanel.addGraphListener(this);
    }
    
    public Scrollbar getHyperSB() { return hyperSB; }

    public HyperLens getLens() { return hyperLens; }
    
    public void graphMoved() {} //From GraphListener interface
    public void graphReset() { hyperSB.setValue(0); } //From GraphListener interface
    
    private class hyperAdjustmentListener implements AdjustmentListener {
        public void adjustmentValueChanged(AdjustmentEvent e) {
            updateInverseArray();
            tgPanel.repaintAfterMove();
        }
    }
    
    double rawHyperDist (double dist) {  //The hyperbolic transform
        if(hyperSB.getValue()==0) return dist;
        double hyperV=hyperSB.getValue();
        return Math.log(dist/(Math.pow(1.5,(70-hyperV)/40)*80) +1);
        /*
        double hyperD = Math.sqrt(dist+(10.1-Math.sqrt(hyperV)))-Math.sqrt(10.1-Math.sqrt(hyperV));
        */
        
    }    
    
    double hyperDist (double dist) { 
        
        double hyperV=hyperSB.getValue();
        //Points that are 250 away from the center stay fixed.
        double hyperD= rawHyperDist(dist)/rawHyperDist(250)*250;
        double fade=hyperV;
        double fadeAdjust=100;
        hyperD=hyperD*fade/fadeAdjust+dist*(fadeAdjust-fade)/fadeAdjust;
        return hyperD;

    }    
    
    void updateInverseArray(){
        double x;
        for(int i=0;i<200;i++) { 
            x=width*i/200; //Points within a radius of 'width' will have exact inverses.
            inverseArray[i]=hyperDist(x);
        }    
    };
    
    int findInd(int min, int max, double dist) {
        int mid=(min+max)/2;
        if (inverseArray[mid]<dist)
            if (max-mid==1) return max;
            else return findInd(mid,max,dist);
        else
            if (mid-min==1) return mid;
            else return findInd(min,mid,dist);
    }
    
    double invHyperDist (double dist) { //The inverse of hyperDist
        
        if (dist==0) return 0;
        int i;
        if (inverseArray[199]<dist) i=199;
        else i=findInd(0,199,dist);        
        double x2=inverseArray[i];
        double x1=inverseArray[i-1];
        double j= (dist-x1)/(x2-x1);
        return(((double) i+j-1)/200.0*width);
    }


     class HyperLens extends TGAbstractLens {
        protected void applyLens(TGPoint2D p) {
            double dist=Math.sqrt(p.x*p.x+p.y*p.y);
            if(dist>0) {
                p.x=p.x/dist*hyperDist(dist);
                p.y=p.y/dist*hyperDist(dist);
            }
            else { p.x =0; p.y=0;}
        }
        
        protected void undoLens(TGPoint2D p) {
            double dist=Math.sqrt(p.x*p.x+p.y*p.y);
            if(dist>0) {
                p.x=p.x/dist*invHyperDist(dist);
                p.y=p.y/dist*invHyperDist(dist);
            }
            else { p.x =0; p.y=0;}
        }
    }


} // end 
