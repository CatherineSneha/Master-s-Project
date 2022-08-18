const retrieveButton = document.getElementById('retrieveButton');
const test = document.getElementById('test');

// mouseover event on the items in menu bar 
test.addEventListener("mouseover", function( event ) {
   // highlight the mouseover target
   event.target.style.color = "orange";
 
   // reset the color after a short delay
   setTimeout(function() {
     event.target.style.color = "";
   }, 500);
 }, false);
 
// function to validate the Registerationform in the register page
function validateRegisterForm() {
      
    if( document.registerForm.fname.value == "" ) {
      alert( "Please provide your First name!" );
       document.registerForm.inputFname.focus() ;
       return false;
    }
    if( document.registerForm.email.value == "" ) {
       alert( "Please provide your Email!" );
       document.registerForm.email.focus() ;
       return false;
    }
    if( document.registerForm.zip.value == "" || isNaN( document.registerForm.zip.value ) ||
       document.registerForm.zip.value.length != 7 ) {
       
       alert( "Please provide a zip in the format #######." );
       document.registerForm.zip.focus() ;
       return false;
    }
    if( document.registerForm.country.value == "-1" ) {
       alert( "Please provide your country!" );
       return false;
    }
   
    // To store data in local storage
    console.log("store records");
    var fname1 = document.getElementById('inputFname').value;
    var lname1 = document.getElementById('inputLname').value;
    var email1 = document.getElementById('inputEmail4').value;
    var password1 = document.getElementById('inputPassword4').value;
    var address11 = document.getElementById('inputAddress').value;
    var address21 = document.getElementById('inputAddress2').value;
    var country1 = document.getElementById('inputCountry').value;
    var city1 = document.getElementById('inputCity').value;
    var state1 = document.getElementById('inputState').value;
    var zip1 = document.getElementById('inputZip').value;
    var key1 = fname1;
    const userDetails = {
        fname: fname1,
        lname: lname1,
        email : email1,
        password : password1,
        address1 : address11,
        address2 : address21,
        country : country1,
        city : city1,
        state : state1,
        zip : zip1,
    }
    console.log(userDetails);
    window.localStorage.setItem(key1,JSON.stringify(userDetails));
    
    return( true );
 }

function retrieveRecords(){ //retrieves items in the localStorage
    console.log("retrieve records");

    var archive = [];
    for (var i = 0; i<localStorage.length; i++) {
            archive[i] = localStorage.getItem(localStorage.key(i));
    }
    console.log(archive);

   // displays it as a table on the web page
   for(var j = 0 ; j < archive.length ; j++){
      console.log(archive[j]);
     $('tbody').append(`<tr>
     <td style="font-style: Ubuntu;">${archive[j]}</td>
   </tr>`)
}
   //  var paragraph = document.createElement("p");
   //  var infor = document.createTextNode(archive);
   //  paragraph.appendChild(infor);
   //  var element = document.getElementById("retrieve");
   //  element.appendChild(paragraph);
    
}

window.onload =function(){ //ensures the page is loaded before functions are executed.
    retrieveButton.onclick = retrieveRecords;
}