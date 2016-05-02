
var clinic =
{


    body:
    {

        init: function()
        {

            var window_height = parseInt(clinic.window.height());

            var footer_height = parseInt($('#footer').css('height'));
            var header_height = parseInt($('#header').css('height'));
            var menu_height   = parseInt($('#menu').css('height'));

            $('#content').css('min-height', window_height - footer_height - header_height - menu_height);
            $('#record').css('min-height', (window_height - footer_height - header_height - menu_height) * 0.7);
        }
    },

    window:
    {
        height: function()
        {
            if (typeof(window.innerWidth) == 'number')
            {
                return window.innerHeight; // non-IE
            }
            else if (document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ))
            {
                return document.documentElement.clientHeight; // IE 6+ in 'standards compliant mode'
            }
            else if (document.body && ( document.body.clientWidth || document.body.clientHeight ))
            {
                return document.body.clientHeight; // IE 4 compatible
            }
            else
            {
                return NaN;
            }
        },

        width: function()
        {
            if (typeof( window.innerWidth ) == 'number')
            {
                return window.innerWidth; // non-IE
            }
            else if (document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ))
            {
                return document.documentElement.clientWidth; // IE 6+ in 'standards compliant mode'
            }
            else if (document.body && ( document.body.clientWidth || document.body.clientHeight ))
            {
                return document.body.clientWidth; // IE 4 compatible
            }
            else
            {
                return NaN;
            }
        }
    },
    semantic:
    {
        init:
        {
            dropdown: function()
            {
                $(function() {
                    $('.ui.dropdown').dropdown();
                });
            },

            checkbox: function()
            {
                $(function() {
                    $('.ui.checkbox').checkbox();
                });
            },

            rating: function()
            {
                $(function() {
                    $('.ui.rating').rating();
                });
            },
            sidebar: function() {
                $(function () {
                    $('.ui.sidebar').sidebar();
                });
            }
            }
    }
};
