/**
 * Created by nastya on 29.04.16.
 */

window.api_url = "http://localhost:3000/api/";
window.api_part_card = "cards/";
window.api_part_medical_speciality = "medical_speciality/";
window.api_part_card_record = "card_records/";

window.record_selector = "#record";

function json_parse(source) {
    var out = '';

    $.ajax({
        url: source,
        dataType: 'html',
        async: false,

        success: function (result) {
            out = json_escape(result);
            out = JSON.parse(out);
        }
    });

    console.log(out);

    return JSON.parse(out);
}
function json_escape(string) {
    var cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
        escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
        meta = { // table of character substitutions
            '\b': '\\b',
            '\t': '\\t',
            '\n': '\\n',
            '\f': '\\f',
            '\r': '\\r',
            '"': '\\"',
            '\\': '\\\\'
        };

    escapable.lastIndex = 0;
    return escapable.test(string) ? '"' + string.replace(escapable, function (a) {
        var c = meta[a];
        return typeof c === 'string' ? c :
        '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
    }) + '"' : '"' + string + '"';
}

function html_card_record(id){
    var card_record = json_parse(window.api_url + window.api_part_card_record + id);

    clear_selector(window.record_selector);

    var card_record_struct = window.Card_record.construct_card_record(card_record);

    $(window.record_selector).append("<h3>Запись от  " + card_record_struct.add_date + "</h3>");
    $(window.record_selector).append("<h4>Симтомы</h4>");
    $(window.record_selector).append("<p>" + card_record_struct.symptoms + "</p>");
    $(window.record_selector).append("<h4>Диагноз </h4>");
    $(window.record_selector).append("<p>" + card_record_struct.diagnosis + "</p>");
    $(window.record_selector).append("<h4>Назначение </h4>");
    $(window.record_selector).append("<p>" + card_record_struct.treatment + "</p>");

    console.log(card_record)
}

function clear_selector(selector) {
    $(selector).html("");
}
