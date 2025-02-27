/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.smvdu.payroll.taxmanager;

import org.smvdu.payroll.beans.BaseBean;

/**
 *
 *  *  Copyright (c) 2010 - 2011 SMVDU, Katra.
*  All Rights Reserved.
**  Redistribution and use in source and binary forms, with or 
*  without modification, are permitted provided that the following 
*  conditions are met: 
**  Redistributions of source code must retain the above copyright 
*  notice, this  list of conditions and the following disclaimer. 
* 
*  Redistribution in binary form must reproduce the above copyright
*  notice, this list of conditions and the following disclaimer in 
*  the documentation and/or other materials provided with the 
*  distribution. 
* 
* 
*  THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED 
*  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
*  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
*  DISCLAIMED.  IN NO EVENT SHALL SMVDU OR ITS CONTRIBUTORS BE LIABLE 
*  FOR ANY DIRECT, INDIRECT, INCIDENTAL,SPECIAL, EXEMPLARY, OR 
*  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
*  OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
*  BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
*  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
*  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
*  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
* 
* 
*  Contributors: Members of ERP Team @ SMVDU, Katra
*
 */
public class EmployeeTax extends BaseBean {
    
   
    private String name;
    private float TaxAmount;
    private float netSaving;
    private float educess;
    private float higheducess;
    private float surcharge;
    private int quater;
    private int session;
	 
   /* private float amount;
    public float netSaving;
    private float effectiveIe;
    private float educesse;

    public float getEducesse() {
        return educesse;
    }

    public void setEducesse(float educesse) {
        this.educesse = educesse;
    }

     

      public float getEffectiveIe() {
        return effectiveIe;
    }

    public void setEffectiveIe(float effectiveIe) {
        this.effectiveIe = effectiveIe;
    }

    
    public float getNetSaving() {
        return netSaving;
    }

    public void setNetSaving(float netSaving) {
        System.out.println("Net Saving In Employee  : "+netSaving);
        this.netSaving = netSaving;

    }
    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }
    
    
   
    */
   public float getTaxAmount() {
        return TaxAmount;
    }

    public void setTaxAmount(float TaxAmount) {
        this.TaxAmount = TaxAmount;
    }

    public float getEducess() {
        return educess;
    }

    public void setEducess(float educess) {
        this.educess = educess;
    }

    public float getHigheducess() {
        return higheducess;
    }

    public void setHigheducess(float higheducess) {
        this.higheducess = higheducess;
    }

    public float getSurcharge() {
        return surcharge;
    }

    public void setSurcharge(float surcharge) {
        this.surcharge = surcharge;
    }
  public float getNetSaving() {
        return netSaving;
    }

    public void setNetSaving(float netSaving) {
        System.out.println("Net Saving In Employee  : "+netSaving);
        this.netSaving = netSaving;
    }

    public int getQuater() {
        return quater;
    }

    public void setQuater(int quater) {
        this.quater = quater;
    }

    public int getSession() {
        return session;
    }

    public void setSession(int session) {
        this.session = session;
    }
 
    

}
