function mosaicFading(element) {
    element = $(element);
    element.hover(
            function() {
                $(this).fadeTo('slow', 0.6);
            },
            function() {
                $(this).fadeTo('slow', 1);
            }
            );
}

function bgCentralizing(element, bgWidth, bgHeight) {
    element = $(element);
    var winWidth = $(window).width();
    var winHeight = $(window).height();

    element.css({
        left: (winWidth - bgWidth) / 2 + 'px',
        top: (winHeight - bgHeight) / 2 + 'px'
    });
}

function bgBuildColsAndRows(element, nums_on_x, nums_on_y) {
    var rows = [];
    var cols = [];

    var i, j;
//    var debug_div = $('#debug');
//    debug_div.append(nums_on_x + ' ' + nums_on_y + "\n");

    for (i = 0; i < nums_on_x; i++) cols.push(Array());

    for (j = 0; j < nums_on_y; j++) {
        var row = Array();
        for (i = 0; i < nums_on_x; i++) {
            var part_id = element + ' #part_' + i + 'x' + j;
            var part = $(part_id);
            part.hide();

            row.push(part);
            cols[i].push(part);
//            debug_div.append(part_id);
        }
        rows.push(row);
//        debug_div.append("\n");
    }

    return {
        cols: cols,
        rows: rows
    }
}

function bgShowMatrix(cols) {
    var i, j;
    var step = 150;
//    var debug_div = $('#debug');

    var delays = [];
    for (i in cols) delays.push(Math.round((Math.random() * 3 + 2 - i * 0.08) * step));

    for (i in cols) {
        for (j in cols[i]) {
            var part = cols[i][j];
            part.delay(delays[i] + j * step).fadeTo('fast', 1);
//            debug_div.append(part.attr('id'));
        }
//        debug_div.append("\n");
    }
}

var ki = 0.46;
var kj = 1.8;
var factor = 35;
function bgShowFromCorner(rows) {
    var i, j;
//    var debug_div = $('#debug');

    for (i in rows) {
        for (j in rows[i]) {
            var part = rows[i][j];
            var sum = ki * i + kj * j;
            part.delay(sum * factor).fadeTo('fast', 1);
//            debug_div.append(Math.round(sum * 100) / 100 + ' ');
        }
//        debug_div.append("<br/>\n");
    }
//    debug_div.append("<hr/>\n");
}

//function bgSimpleHideFromCorner(rows) {
//    var i, j;
////    var ki = 0.33;
////    var kj = 2;
////    var factor = 35;
//
//    for (i in rows) {
//        for (j in rows[i]) {
//            var part = rows[i][j];
//            var sum = ki * i + kj * j;
//            part.delay(sum * factor).fadeTo('fast', 0);
//        }
//    }
//}

function bgHideFromCorner(rows) {
    var i, j;
//    var ki = 0.33;
//    var kj = 2;
//    var factor = 35;
//    var debug_div = $('#debug');
    var first_noqueue = -1;

    for (i = rows.length - 1; i >= 0; i--) {
        for (j = rows[i].length - 1; j >= 0; j--) {
            var part = rows[i][j];
//            var sum = ki * i + kj * j;

//            debug_div.append(part.queue('fx').length + ' ');

            if (part.queue('fx').length > 0) {
                part.dequeue();
                part.hide();
            } else {
                if (first_noqueue == -1) first_noqueue = rows[i].length - j - 1;
                var sum = ki * (rows.length - i - 1) + kj * (rows[i].length - j - 1 - first_noqueue);
                part.delay(sum * factor).fadeTo('fast', 0);
            }

//            debug_div.append(Math.round(sum * 100) / 100 + ' ');
        }
//        debug_div.append("<br/>\n");
    }
//    debug_div.append("<hr/>\n");
//    debug_div.append(first_noqueue);
}

//function bgHideParts(rows) {
//    var i, j;
//    for (i in rows) {
//        for (j in rows[i]) {
//            var part = rows[i][j];
//            part.hide();
//        }
//    }
//}

function projectFading(element) {
    element = $(element);
    element.hover(
            function() {
                $(this).fadeTo('fast', 1);
            },
            function() {
                $(this).fadeTo('fast', 0.8);
            }
            );
}

var curr_click_element = null;
var was_dragged = false;
function projectBgFading(element, cols_and_rows) {
    element = $(element);

//    element.hover(
//            function() {
//                bgShowFromCorner(cols_and_rows['rows']);
//            },
//            function() {
//                if (curr_click_element == element) return;
//                bgHideFromCorner(cols_and_rows['rows']);
//            });

    element.click(function() {
        if (was_dragged) {
            was_dragged = false;
            return;
        }
        curr_click_element = element;
        bgShowFromCorner(cols_and_rows['rows']);
    });
}

function showProjects() {
    var counter = $('.project_item').size(),
            viewPortWidth = $(window).width(),
            viewPortHeight = $(window).height() - $('#menu').height();
            optimalViewPortHeight = viewPortHeight / 800;

    var i;
    for (i = 0; i < counter; i++) {
        var _this = $('.counter' + i);

        var normalized_visits = _this.attr('normalized_visits');

        //size
        var optima_height = _this.attr('optima_height');
        _this.css('height', optima_height * normalized_visits * 0.8 * optimalViewPortHeight );

        _this.css('left', _this.attr('left') * viewPortWidth);
        _this.css('top', _this.attr('top') * viewPortHeight);

//        show delay
        _this.delay(Math.random() * 1000 + 800).fadeTo(2500, 1);

//        XY[0,0] = _this.attr('left');
//        XY[0,1] = _this.attr('top');
//        XY[1,0] = _this.attr('left')optima_width * normalized_visits * 0.8;
//        XY[1,1] = _this.attr('top')+optima_height * normalized_visits * 0.8;



    }

//    projectFading('.project_item');
}

function draggableProjects() {
    $('.project_item').draggable({
        opacity: 0.35,
        stop: function() {
            was_dragged = true;
            updateProjectPosition(
                    parseFloat($('.ui-draggable-dragging').attr('id').replace('project_', '')),
                    parseFloat($('.ui-draggable-dragging').css('left')),
                    parseFloat($('.ui-draggable-dragging').css('top'))
                    );
        }
//        revert: true
    });
}

function updateProjectPosition(id, left, top) {

var
//    viewPortWidth = $(window).width() > 800 ? $(window).width() : 800,
//    viewPortHeight = $(window).height() > 500 ? $(window).height() - $('#menu').height() : 500 - $('#menu').height();
    viewPortWidth = $(window).width();
    viewPortHeight = $(window).height() - $('#menu').height();

    left = left / viewPortWidth;
    top = top / viewPortHeight;

    $.ajax({
        type: "GET",
        url: "/projects/" + id + '/update_position',
        data: {
            left: left,
            top: top
        }
//        ,
//        success: function(msg) {
//            alert('8)');
//        }
    });
}