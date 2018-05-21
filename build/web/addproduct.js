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
$(document).ready(function(){
    var id=$("#id").val();
    if(id=="")
    {
        return false;
    }
});
