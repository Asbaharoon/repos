<?php
        setlocale(LC_MONETARY, 'en_IN');
        $this->load->library('reportlist1');
        $count = 1;
        $this->load->library('session');
        $date1 = $this->session->userdata('date1');
        $date2 = $this->session->userdata('date2');
        $fy_start=explode("-",$date1);
        $fy_end=explode("-",$date2);

        $curr_year = '('.$fy_start[0] ."-" .$fy_end[0] .')';
        $prev_year = '(' . ($fy_start[0]-1) ."-" . ($fy_end[0]-1) .')';

        $asset = new Reportlist1();

        echo "<table border=0 class=\"simple-table balance-sheet-table\" >";
        echo "<thead><tr><th></th><th align=\"center\" colspan=\"2\">CURRENT YEAR</th><th align=\"center\" colspan=\"2\">PREVIOUS YEAR</th></tr></thead>";
	$asset->get_Assetschedule('2004',8, 'view', 'NULL');
	$current_total = $asset->curr_total1;
	$prev_total=$asset->prev_total;
	      echo "<tr>";
                        echo "<td>";
                                echo "<strong> TOTAL</strong>";
                        echo "</td>";

                        echo "<td colspan=\"2\" align=\"right\">";
                                echo "<strong>" . convert_amount_dc($current_total) . "</strong>";
                        echo "</td>";

                    /*    echo "<td>";
                                echo "<strong>" . convert_amount_dc(-$cr_total1) . "</strong>";
                        echo "</td>";*/

                        echo "<td align=\"right\">";
                                echo "<strong>" . convert_amount_dc($prev_total) . "</strong>";
                        echo "</td>";

                   /*     echo "<td>";
                                echo "<strong>" . convert_amount_dc(-$old_cr_total1) . "</strong>";
                        echo "</td>"; */
                echo "</tr>";
        echo "</table>";
?>

