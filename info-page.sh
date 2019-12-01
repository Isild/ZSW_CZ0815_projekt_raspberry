#!/bin/bash
echo "Content-type: text/html"
echo ''

echo "<!DOCTYPE html>"
echo "<html lang=\"pl\">"
    echo "<head>"
        echo "<meta charset=\"utf-8\" />"
      	echo "<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">"
        echo "<script src=\"https://code.jquery.com/jquery-3.4.1.js\"></script>"
        echo "<style>"
            echo "#main{"
                echo "margin: 10px;"
            echo "}"
            
            echo ".nav{"
                echo "background-color: #333;"    
                echo "padding: 8px;"        
            echo "}"
            echo "ul {"
              echo "list-style-type: none;"
              echo "margin: 0;"
              echo "padding: 0;"
              echo "overflow: hidden;"
              echo "background-color: #333;"
            echo "}"

            echo "li {"
              echo "float: left;"
            echo "}"

            echo "li a {"
              echo "display: block;"
              echo "color: white;"
              echo "text-align: center;"
              echo "padding: 14px 16px;"
              echo "text-decoration: none;"
            echo "}"

            echo "li a:hover {"
              echo "background-color: #111;"
            echo "}"
        echo "</style>"
        echo "<title>Informacje o serwerze NAS</title>"
    echo "</head>"
echo "<body>"
    echo "<ul class="nav nav-tabs">"
      #echo "<li><a id=\"tab1\" data-toggle=\"tab\">Zakladka 1</a></li>"
      #echo "<li><a id=\"tab2\" data-toggle=\"tab\">Zakladka 2</a></li>"
      #echo "<li><a id=\"tab3\" data-toggle=\"tab\">Zakladka 3</a></li>"
    echo "</ul>"

    echo "<center>"
        echo "<div id=\"main\">"
            echo "<h1>Serwer NAS</h1>"
            echo "<blockquote>"
                echo "<p>Wlasciwosci twojego serwera NAS</p>"
            echo "</blockquote>"
        echo "</div>"
    echo "</center>"

  echo "<div id=\"df\" class=\"container\">"
    echo "<table class=\"table table-hover\">"
      echo "<thead>"
        echo "<tr>"
          echo "<th scope=\"col\"> </th>"
          echo "<th scope=\"col\">System plikow</th>"
          echo "<th scope=\"col\">Rozmiar</th>"
          echo "<th scope=\"col\">Wykorzystanie</th>"
	  echo "<th scope=\"col\">Dostepne</th>"
	  echo "<th scope=\"col\">Wykorzystanie[%]</th>"
  	  echo "<th scope=\"col\">Zamontowane na</th>"
        echo "</tr>"
      echo "</thead>"
      echo "<tbody>"
CONM=0
NAM=6
CON=0
for var in `df -h | grep -- '^/dev/root\|md'`
do
#	if [ $CONM -gt $NAM ] ; then
		#echo "tu $CON"
		modulo=$(($CON%6))
		#echo "wynik: $modulo"

		if [ $modulo -eq 0 ] ; then
			echo "<tr><th scope\"row\"></th>"
		fi

		echo "<td> $var </td>"

		if [ $modulo -eq 5 ] ; then
			echo "</tr>"
		fi
		CON=$(($CON+1))
#	fi
#	CONM=$(($CONM+1))
done
      echo "</tbody>"
    echo "</table>"
  echo "</div>"


echo "<div class=\"container\">"
#	echo `cat /proc/mdstat`
for var in `cat /proc/mdstat`
do
	if [[ "$var" == "md"[0-9] ]] ; then
		echo "<br><b>$var</b>"
	elif [[ "$var" == "unused" ]] ; then
		echo "<br><b>$var</b>"
	elif [[ "$var" == "devices:" ]] ; then
		echo "<b>$var</b>"
	elif [[ "$var" == "Personalities" ]] ; then
		echo "<br><b>$var</b>"
	elif [[ "$var" =~ ^[0-9]{4} ]] ; then
		echo "<br>&emsp; $var"
	else
		echo "$var"
	fi
#	echo "$var"
done
echo "</div>"

echo "<script>"
echo "\$(document).ready(function(){"
    echo "\$( \"#tab1\" ).click(function(){"
          echo "\$( \"#fd\" ).show();"  
    echo "});"
    echo "\$( "#tab2" ).click(function(){"
          echo "\$( \"#fd\" ).hide();"  
    echo "});"
echo "});"
echo "</script>"

echo "</body>"
echo "</html>"
