package org.iitk.livetv.gui;

/**
 * ChannelListCellRendered.java
 *
 * See LICENCE file for usage and redistribution terms
 * Copyright (c) 2013 ETRG,Kanpur.
 */

import java.awt.Font;
import java.awt.Color;
import java.awt.Component;

import javax.swing.JList;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import javax.swing.ListCellRenderer;
import javax.swing.DefaultListCellRenderer;

/**
 *  @author <a href="mailto:ashish.knp@gmail.com">Ashish Yadav </a>
 */

class ChannelListCellRendered implements ListCellRenderer {

        protected DefaultListCellRenderer defaultRenderer = new DefaultListCellRenderer();

        public Component getListCellRendererComponent(JList list, Object value,int index, boolean isSelected, boolean cellHasFocus) {
                Font theFont = null;
                Color theForeground = null;
                ImageIcon theIcon = null;
                String ch_name = null;

                JLabel renderer = (JLabel) defaultRenderer.getListCellRendererComponent(list, value, index, isSelected,cellHasFocus);
                if (value instanceof Object[]) {
                        Object values[] = (Object[]) value;
                        theFont = (Font) values[0];
                        theForeground = (Color) values[1];
                        theIcon = (ImageIcon) values[2];
                        ch_name= (String) values[3];
                } else {
                        theFont = list.getFont();
                        theForeground = list.getForeground();
                        ch_name="";
                }
                if (isSelected) {
                        renderer.setForeground(theForeground);
                }
                if (theIcon != null) {
                        renderer.setIcon(theIcon);
                }
		renderer.setText(ch_name);
                renderer.setFont(theFont);
                return renderer;
        }
}

