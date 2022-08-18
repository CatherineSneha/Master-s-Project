const confirmButton = document.getElementById('confirmButton')
const submit1 = document.getElementById('submit');
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

// function to validate the form in the help center page
function validate() {
      
    if( document.myForm.inputFname.value == "" ) {
        alert( "Please provide your First name!" );
       //text="Please provide your First name!";
       document.myForm.inputFname.focus() ;
       return false;
    }
    if( document.myForm.email.value == "" ) {
       alert( "Please provide your Email!" );
       document.myForm.email.focus() ;
       return false;
    }
    if( document.myForm.inputZip.value == "" || isNaN( document.myForm.inputZip.value ) ||
       document.myForm.inputZip.value.length != 7 ) {
       
       alert( "Please provide a zip in the format #####." );
       document.myForm.inputZip.focus() ;
       return false;
    }
    if( document.myForm.country.value == "-1" ) {
       alert( "Please provide your country!" );
       return false;
    }

    // To store data in local storage
    console.log("store records");
    var fname = document.getElementById('fname').value;
    var lname = document.getElementById('lname').value;
    var email = document.getElementById('email').value;
    var address1 = document.getElementById('address1').value;
    var address2 = document.getElementById('address2').value;
    var country = document.getElementById('icountry').value;
    var city = document.getElementById('city').value;
    var state = document.getElementById('state').value;
    var zip = document.getElementById('zip').value;
    var message = document.getElementById('imessage').value;
    var key = document.getElementById('fname').value;
    const formDetails = {
        fname: fname,
        lname: lname,
        email : email,
        address1 : address1,
        address2 : address2,
        country : country,
        city : city,
        state : state,
        zip : zip,
        message : message,
    }
    console.log(formDetails);
    window.localStorage.setItem(key,JSON.stringify(formDetails));
    
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
    // // displays it as a paragraph on the web page
    // var paragraph = document.createElement("p");
    // var infor = document.createTextNode(archive);
    // paragraph.appendChild(infor);
    // var element = document.getElementById("retrieve");
    // element.appendChild(paragraph);
    
}

window.onload =function(){ //ensures the page is loaded before functions are executed.
    retrieveButton.onclick = retrieveRecords;
}