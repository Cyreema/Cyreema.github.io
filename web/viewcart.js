// JavaScript Document
$(document).ready(function(){
			$(".fa-bars").mouseenter(opennav);
		});
		function opennav(){
			$(".sidenav").css("width","300px");
		}
                
                
$(document).ready(function(){
			$(".sidenav").mouseleave(closenav);
		});
		function closenav(){
			$(".sidenav").css("width","0%");
		}
$(document).ready(function() {
$("#send").click(function(e) {
//e.preventDefault();
var proname = $("#proname").val();
var price = $("#price").val();
var cartitemid = $("#cartitemid").val();
if (!(proname == '' || price == '' || cartitemid == '')) {
    
} else {
    return false;
alert("Please Fill All Fields.");
}
});
});