/* 
 *@date 11/12/14
 *@author Graham Murray
 *@file nameCookie.js
 *This code is for the feature that remembers a users name and expires after a set amount of time
 */

function setCookie()
{
    var cname = "username";
    var cvalue = document.getElementById("username").value;
    var exdays = 7;
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
    checkCookie();
}

function getCookie(cname)
{
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++)
    {
        var c = ca[i].trim();
        if (c.indexOf(name) == 0)
            return c.substring(name.length, c.length);
    }
    return "";
}

function checkCookie()
{
    var user = getCookie("username");
    
    if(user !== ""){
        alert("Welcome, " + user);
    }else{
        alert("Welcome New User. Please Add your name.");
    }    
}
function load(){
    var user = getCookie("username");
    
    if(user == ""){
        alert("Welcome New User. Please Add your name.");
    }  
}
function outputCookie()
{
    var user = getCookie("username");
    if (user == "") {
        document.write("<p></p>");
    }else{
        document.write("<p>Hello, " + user + "</p>");
    }
}