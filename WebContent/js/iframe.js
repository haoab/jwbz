/**
 * 
 */
	$(window.parent.document).find("#iframe1").load(function(){
		var main = $(window.parent.document).find("#iframe1");
		var thisheight = $(document).height()+5;
		//alert(thisheight);
		main.height(thisheight);
	});
