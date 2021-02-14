$(function(){
	function display(bool) {
        if (bool) {
			$("#container").show();
			$(".craftables").remove();
        } else {
			$("#container").hide();
        }
    }

	display(false)


	$("#close").click(function () {
		$.post('http://esx_weaponcraft/exit', JSON.stringify({
		}));
		$("#yalum").text();
        return
	})

	$("#switch-blade").click(function () {
		$.post('http://esx_weaponcraft/switch-blade', JSON.stringify({
		}));
        return
	})
	

//

	var alum = 0
	window.addEventListener('message', (event) => {
		window.addEventListener('message', (event) => {
			if (event.data.type === 'ic') {
				alum = event.data.alum
				if (alum >= 1){
					$("#yalum").text("3 Aluminium");
				if (alum <= 0)
					$("#nalum").text("3 Aluminium");
				}
					
				
			}
		});
	});

	window.addEventListener('message', (event) => {
		var k = event.data.ca
        var v = event.data.ba
		if (event.data.type === 'ic2') {
			console.log(v.item)
			$(".items").append('<div class="craftables" style="margin: 5px;"><button class="craft-button" id="'+v.item+'" type="submit">'+ v.item+'</button><p style="font-size: 15px;">'+v.cost+'</p>');
			$("#"+v.item).data("data", v.item);
		}
	});
	$(document).on("click", ".craft-button", function (e) { 
        var data = $(this).data("data")
		$.post('http://esx_weaponcraft/craft', JSON.stringify({data: data}));
    });
	window.onload = (e) => {
        /* 'links' the js with the Nui message from main.lua */
		window.addEventListener('message', (event) => {
            //document.querySelector("#logo").innerHTML = " "
			var item = event.data;
			if (item !== undefined && item.type === "ui") {
                /* if the display is true, it will show */
				if (item.display === true) {
                    display(true)
                     /* if the display is false, it will hide */
				} else{
                    display(false)
                }
			}
		});
	};
});