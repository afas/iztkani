function align_popen_menu() {
    var popen = $('div.popover');
    if ($.browser.msie && parseInt(navigator.appVersion.substring(22)) < 8) {
        popen.css('position', 'relative');
    }

    var li = $('a[href="/categories"]').parent('li');
    popen.css('width', li.css('width'));
}

$(document).ready(function() {
    align_popen_menu();

    $('.like-wrap').hover(function() {
        $('.like-text').show();
    }, function() {
        $('.like-text').hide();
    });


    if ($.browser.msie && $.browser.versionNumber < 7) {
        $('#top_menu li.ancestor').hover(function() {
            $(this).toggleClass('hover');
        });
    }

    if ($('#cart').length > 0) {
        $('#cart').draggable({
            handle: ".cart-title"
        });

        $('.cart-title').dblclick(function() {
            $('#cart').hide("explode", 300);
        });
    }

//    setWrapperMargin();
//
//    $(window).resize(function() {
//        setWrapperMargin();
//    });

});

//function setWrapperMargin() {
//    if ($(".rm_wrapper").length > 0) {
//        var wrapperMargin = ($(window).height() - 106 - 390 - 45) / 2;
//
//        if (wrapperMargin < 25) {
//            wrapperMargin = 25;
//        }
//        $(".body").css("margin", wrapperMargin + "px auto");
//    }
//
//    if ($(window).width() / $(window).height() < 1.1)
//        $('.bg_image').hide();
//    else
//        $('.bg_image').show();
//}

function cartHideShow() {
    $("#cart").show("explode", 300);
}