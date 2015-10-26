/*
 * @author Graham Murray
 * @date 10/12/14
 * @file timeAjax.js
 */

var XHRObject = false;
            
            if(window.XMLHttpRequest)
            {
                //Not Microsoft
                XHRObject = new XMLHttpRequest();
            }
            else if(window.ActiveXObject)
            {
                //Windows IE
                XHRObject = new ActiveXObject("Microsoft.XMLHTTP");
            }
            
            function getServerTime(divID)
            {
                if(XHRObject)
                {
                    //Get a reference to the div i want to put the response into
                    var obj = document.getElementById(divID); 
                    
                    //Open a connection to the server
                    //Tell it I want to make a get request to timeServer.jsp
                    XHRObject.open("GET","timeServer.jsp");
                    
                    //Set up a function to handle the response
                    XHRObject.onreadystatechange = function(){
                        
                        if(XHRObject.readyState == 4 && XHRObject.status == 200)
                        {
                            //XHRObject.readyState == 4 data received from server
                            //XHRObject.status == 200 HTTP Success
                            //We have received valid response
                            obj.innerHTML = XHRObject.responseText;
                        }
                    }
                    
                    //Everything is setup so send the request
                    XHRObject.send(null);
                }
            }