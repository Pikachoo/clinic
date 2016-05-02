/**
 * Created by nastya on 25.03.16.
 */
clinic.semantic.sidebar = {};

// ready event
clinic.semantic.sidebar.ready = function() {

    // selector cache
    var
    // alias
        handler
        ;

    $('.variation .button')
        .on('click', function() {
            $(this)
                .toggleClass('active')
                .siblings()
                .removeClass('active')
            ;
            $('.sidebar')
                .filter($(this).data('variation') ).first()
                .sidebar('toggle')
            ;
        })
    ;



};



