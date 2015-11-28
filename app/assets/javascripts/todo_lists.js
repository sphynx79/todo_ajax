$(document).ready(function() {
     $(".index_row").mouseenter(function () {
                    $(this).find('.trash').fadeTo(500,1);

                });
    $(".index_row").mouseleave(function (){                   
                    $(this).find('.trash').fadeTo(500,0);
                });
});
